<?php
include __DIR__ . "/../../config/database.php";
include __DIR__ . "/../../config/auth.php";
requirePermission($conn, "View Attendance");

function hasTable(mysqli $conn, string $table): bool {
    $safe = $conn->real_escape_string($table);
    $result = $conn->query("SHOW TABLES LIKE '{$safe}'");
    return $result && $result->num_rows > 0;
}

function hasColumn(mysqli $conn, string $table, string $column): bool {
    $safeTable = $conn->real_escape_string($table);
    $safeColumn = $conn->real_escape_string($column);
    $result = $conn->query("SHOW COLUMNS FROM `{$safeTable}` LIKE '{$safeColumn}'");
    return $result && $result->num_rows > 0;
}

function resolveRequestActorName(mysqli $conn, ?int $userId): string {
    if (($userId ?? 0) <= 0 || !hasTable($conn, 'users')) {
        return '';
    }

    $userId = (int)$userId;
    $nameParts = [];

    if (hasTable($conn, 'employees') && hasColumn($conn, 'employees', 'user_id')) {
        $nameColumns = [];
        foreach (['first_name', 'last_name'] as $column) {
            if (hasColumn($conn, 'employees', $column)) {
                $nameColumns[] = "NULLIF(TRIM($column), '')";
            }
        }

        if (count($nameColumns) > 0) {
            $sql = "SELECT TRIM(CONCAT_WS(' ', " . implode(', ', $nameColumns) . ")) AS fullname FROM employees WHERE user_id = ? LIMIT 1";
            $stmt = $conn->prepare($sql);
            if ($stmt) {
                $stmt->bind_param('i', $userId);
                $stmt->execute();
                $result = $stmt->get_result();
                if ($result && $result->num_rows > 0) {
                    $nameParts[] = trim((string)($result->fetch_assoc()['fullname'] ?? ''));
                }
            }
        }
    }

    $userColumns = [];
    $userColumnsResult = $conn->query("SHOW COLUMNS FROM users");
    if ($userColumnsResult) {
        while ($row = $userColumnsResult->fetch_assoc()) {
            $userColumns[] = $row['Field'];
        }
    }
    $idColumn = in_array('id', $userColumns, true) ? 'id' : (in_array('user_id', $userColumns, true) ? 'user_id' : null);
    if ($idColumn !== null) {
        $fallbackColumns = [];
        foreach (['fullname', 'username', 'email'] as $column) {
            if (in_array($column, $userColumns, true)) {
                $fallbackColumns[] = "NULLIF(TRIM($column), '')";
            }
        }
        if (count($fallbackColumns) > 0) {
            $sql = "SELECT COALESCE(" . implode(', ', $fallbackColumns) . ", '') AS display_name FROM users WHERE $idColumn = ? LIMIT 1";
            $stmt = $conn->prepare($sql);
            if ($stmt) {
                $stmt->bind_param('i', $userId);
                $stmt->execute();
                $result = $stmt->get_result();
                if ($result && $result->num_rows > 0) {
                    $nameParts[] = trim((string)($result->fetch_assoc()['display_name'] ?? ''));
                }
            }
        }
    }

    foreach ($nameParts as $name) {
        if ($name !== '') {
            return $name;
        }
    }

    return '';
}


function resolveRequestActionLog(mysqli $conn, string $source, array $row): array {
    $requestId = (int)($row['source_id'] ?? 0);
    $normalizedStatus = strtolower(trim((string)($row['status'] ?? '')));
    $reviewedBy = isset($row['reviewed_by']) ? (int)$row['reviewed_by'] : 0;
    $approvedBy = isset($row['approved_by']) ? (int)$row['approved_by'] : 0;

    if (!hasTable($conn, 'activity_logs') || $requestId <= 0 || $normalizedStatus === '') {
        return ['request_action_at' => '', 'request_action_label' => ''];
    }

    $action = '';
    if ($normalizedStatus === 'endorsed') {
        $action = 'request_endorse';
    } elseif ($normalizedStatus === 'approved') {
        $action = 'request_finalize';
    } elseif ($normalizedStatus === 'denied') {
        $action = $approvedBy > 0 ? 'request_finalize' : ($reviewedBy > 0 ? 'request_endorse' : '');
    }

    if ($action === '') {
        return ['request_action_at' => '', 'request_action_label' => ''];
    }

    $targetPrefix = $source . ':' . $requestId . ' | status=' . ucfirst($normalizedStatus);
    $stmt = $conn->prepare(
        "SELECT created_at
         FROM activity_logs
         WHERE action = ?
           AND target LIKE CONCAT(?, '%')
         ORDER BY created_at DESC
         LIMIT 1"
    );

    if (!$stmt) {
        return ['request_action_at' => '', 'request_action_label' => ''];
    }

    $stmt->bind_param('ss', $action, $targetPrefix);
    $stmt->execute();
    $result = $stmt->get_result();
    if (!$result || $result->num_rows === 0) {
        return ['request_action_at' => '', 'request_action_label' => ''];
    }

    return [
        'request_action_at' => (string)($result->fetch_assoc()['created_at'] ?? ''),
        'request_action_label' => $normalizedStatus === 'endorsed' ? 'Endorsed on' : 'Reviewed on'
    ];
}

function resolveRequestActor(mysqli $conn, string $table, array $row): array {
    $status = strtolower(trim((string)($row['status'] ?? '')));
    $reviewedBy = isset($row['reviewed_by']) ? (int)$row['reviewed_by'] : 0;
    $approvedBy = isset($row['approved_by']) ? (int)$row['approved_by'] : 0;

    $actorId = 0;
    if (in_array($status, ['approved', 'denied'], true)) {
        $actorId = $approvedBy > 0 ? $approvedBy : $reviewedBy;
    } elseif ($status === 'endorsed') {
        $actorId = $reviewedBy;
    } elseif (strpos($status, 'reject') !== false) {
        $actorId = $reviewedBy > 0 ? $reviewedBy : $approvedBy;
    }

    return [
        'request_action_by_name' => resolveRequestActorName($conn, $actorId),
        'request_action_by_role' => $actorId > 0 ? ($table === 'leave_requests' && $status === 'endorsed' ? 'Coach' : '') : ''
    ];
}

function resolveLeavePhotoColumn(mysqli $conn): ?string {
    foreach (['photo_path', 'photo_url', 'attachment_path', 'supporting_photo'] as $column) {
        if (hasColumn($conn, 'leave_requests', $column)) {
            return $column;
        }
    }

    return null;
}

$leavePhotoColumn = resolveLeavePhotoColumn($conn);

$sessionUserId = (int)($_SESSION['user']['id'] ?? 0);
$employeeId = $sessionUserId;

if (hasTable($conn, 'employees') && hasColumn($conn, 'employees', 'user_id') && hasColumn($conn, 'employees', 'employee_id')) {
    $stmt = $conn->prepare("SELECT employee_id FROM employees WHERE user_id = ? LIMIT 1");
    $stmt->bind_param('i', $sessionUserId);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result && $result->num_rows > 0) {
        $employeeId = (int)$result->fetch_assoc()['employee_id'];
    }
}

$items = [];

if (hasTable($conn, 'leave_requests')) {
    $userDisplayColumnName = $userDisplayColumn ?? 'email';
    $userSecondaryColumnName = $userSecondaryColumn ?? 'email';
    $usersIdColumnName = $idColumn ?? 'user_id';

    $ebFullNameExpr = hasColumn($conn, 'employees', 'first_name') && hasColumn($conn, 'employees', 'last_name')
        ? "NULLIF(TRIM(CONCAT_WS(' ', eb_emp.first_name, eb_emp.last_name)), '')"
        : "''";
    $abFullNameExpr = hasColumn($conn, 'employees', 'first_name') && hasColumn($conn, 'employees', 'last_name')
        ? "NULLIF(TRIM(CONCAT_WS(' ', ab_emp.first_name, ab_emp.last_name)), '')"
        : "''";

    $stmt = $conn->prepare(
        "SELECT
            req.leave_id AS source_id,
            req.created_at AS filed_at,
            req.leave_type AS request_type,
            req.reason AS details,
            " . ($leavePhotoColumn !== null ? "req." . $leavePhotoColumn : "NULL") . " AS photo_path,
            CONCAT(COALESCE(req.start_date, ''), CASE WHEN req.end_date IS NOT NULL THEN CONCAT(' to ', req.end_date) ELSE '' END) AS schedule_period,
            req.status,
            req.reviewed_by,
            req.approved_by,
            COALESCE($ebFullNameExpr, eb_u.$userDisplayColumnName, eb_u.$userSecondaryColumnName, '') AS endorsed_by_name,
            COALESCE($abFullNameExpr, ab_u.$userDisplayColumnName, ab_u.$userSecondaryColumnName, '') AS approved_by_name
         FROM leave_requests req
         LEFT JOIN users eb_u ON eb_u.$usersIdColumnName = req.reviewed_by
         LEFT JOIN employees eb_emp ON eb_emp.user_id = eb_u.$usersIdColumnName
         LEFT JOIN users ab_u ON ab_u.$usersIdColumnName = req.approved_by
         LEFT JOIN employees ab_emp ON ab_emp.user_id = ab_u.$usersIdColumnName
         WHERE req.employee_id = ?"
    );
    $stmt->bind_param('i', $employeeId);
    $stmt->execute();
    $res = $stmt->get_result();
    while ($row = $res->fetch_assoc()) {
        $actionMeta = resolveRequestActionLog($conn, 'leave', $row);
        $items[] = [
            'id' => 'leave-' . $row['source_id'],
            'request_source' => 'leave',
            'date_filed' => $row['filed_at'],
            'request_type' => $row['request_type'] ?: 'Leave',
            'details' => $row['details'] ?: '—',
            'photo_path' => trim((string)($row['photo_path'] ?? '')),
            'schedule_period' => trim((string)$row['schedule_period']) ?: '—',
            'status' => $row['status'] ?: 'Pending',
            'endorsed_by_name' => $row['endorsed_by_name'],
            'approved_by_name' => $row['approved_by_name'],
            'request_action_at' => $actionMeta['request_action_at'],
            'request_action_label' => $actionMeta['request_action_label']
        ];
    }
}

if (hasTable($conn, 'overtime_requests')) {
    $userColumns = [];
    $userColumnsResult = $conn->query("SHOW COLUMNS FROM users");
    if ($userColumnsResult) {
        while ($row = $userColumnsResult->fetch_assoc()) {
            $userColumns[] = $row['Field'];
        }
    }
    $idColumn = in_array('id', $userColumns, true) ? 'id' : (in_array('user_id', $userColumns, true) ? 'user_id' : 'user_id');
    $userDisplayColumn = in_array('fullname', $userColumns, true) ? 'fullname' : (in_array('username', $userColumns, true) ? 'username' : 'email');
    $userSecondaryColumn = in_array('email', $userColumns, true) ? 'email' : 'email';

    $userDisplayColumnName = $userDisplayColumn;
    $userSecondaryColumnName = $userSecondaryColumn;
    $usersIdColumnName = $idColumn;

    $ebFullNameExpr = hasColumn($conn, 'employees', 'first_name') && hasColumn($conn, 'employees', 'last_name')
        ? "NULLIF(TRIM(CONCAT_WS(' ', eb_emp.first_name, eb_emp.last_name)), '')"
        : "''";
    $abFullNameExpr = hasColumn($conn, 'employees', 'first_name') && hasColumn($conn, 'employees', 'last_name')
        ? "NULLIF(TRIM(CONCAT_WS(' ', ab_emp.first_name, ab_emp.last_name)), '')"
        : "''";

    $hasReviewedBy = hasColumn($conn, 'overtime_requests', 'reviewed_by');
    $reviewedByExpr = $hasReviewedBy ? 'req.reviewed_by' : 'NULL';

    $stmt = $conn->prepare(
        "SELECT
            req.ot_id AS source_id,
            req.created_at AS filed_at,
            req.ot_type AS request_type,
            req.purpose AS details,
            CONCAT(COALESCE(req.start_time, ''), CASE WHEN req.end_time IS NOT NULL THEN CONCAT(' to ', req.end_time) ELSE '' END) AS schedule_period,
            req.status,
            req.approved_by,
            COALESCE($ebFullNameExpr, eb_u.$userDisplayColumnName, eb_u.$userSecondaryColumnName, '') AS endorsed_by_name,
            COALESCE($abFullNameExpr, ab_u.$userDisplayColumnName, ab_u.$userSecondaryColumnName, '') AS approved_by_name
         FROM overtime_requests req
         LEFT JOIN users eb_u ON eb_u.$usersIdColumnName = $reviewedByExpr
         LEFT JOIN employees eb_emp ON eb_emp.user_id = eb_u.$usersIdColumnName
         LEFT JOIN users ab_u ON ab_u.$usersIdColumnName = req.approved_by
         LEFT JOIN employees ab_emp ON ab_emp.user_id = ab_u.$usersIdColumnName
         WHERE req.employee_id = ?"
    );
    $stmt->bind_param('i', $employeeId);
    $stmt->execute();
    $res = $stmt->get_result();
    while ($row = $res->fetch_assoc()) {
        $actionMeta = resolveRequestActionLog($conn, 'overtime', $row);
        $items[] = [
            'id' => 'ot-' . $row['source_id'],
            'request_source' => 'overtime',
            'date_filed' => $row['filed_at'],
            'request_type' => $row['request_type'] ?: 'Overtime',
            'details' => $row['details'] ?: '—',
            'photo_path' => '',
            'schedule_period' => trim((string)$row['schedule_period']) ?: '—',
            'status' => $row['status'] ?: 'Pending',
            'endorsed_by_name' => $row['endorsed_by_name'],
            'approved_by_name' => $row['approved_by_name'],
            'request_action_at' => $actionMeta['request_action_at'],
            'request_action_label' => $actionMeta['request_action_label']
        ];
    }
}

if (hasTable($conn, 'attendance_disputes')) {
    $userColumns = [];
    $userColumnsResult = $conn->query("SHOW COLUMNS FROM users");
    if ($userColumnsResult) {
        while ($row = $userColumnsResult->fetch_assoc()) {
            $userColumns[] = $row['Field'];
        }
    }
    $idColumn = in_array('id', $userColumns, true) ? 'id' : (in_array('user_id', $userColumns, true) ? 'user_id' : 'user_id');
    $userDisplayColumn = in_array('fullname', $userColumns, true) ? 'fullname' : (in_array('username', $userColumns, true) ? 'username' : 'email');
    $userSecondaryColumn = in_array('email', $userColumns, true) ? 'email' : 'email';

    $userDisplayColumnName = $userDisplayColumn;
    $userSecondaryColumnName = $userSecondaryColumn;
    $usersIdColumnName = $idColumn;

    $ebFullNameExpr = hasColumn($conn, 'employees', 'first_name') && hasColumn($conn, 'employees', 'last_name')
        ? "NULLIF(TRIM(CONCAT_WS(' ', eb_emp.first_name, eb_emp.last_name)), '')"
        : "''";
    $abFullNameExpr = hasColumn($conn, 'employees', 'first_name') && hasColumn($conn, 'employees', 'last_name')
        ? "NULLIF(TRIM(CONCAT_WS(' ', ab_emp.first_name, ab_emp.last_name)), '')"
        : "''";

    $hasReviewedBy = hasColumn($conn, 'attendance_disputes', 'reviewed_by');
    $hasApprovedBy = hasColumn($conn, 'attendance_disputes', 'approved_by');
    $reviewedByExpr = $hasReviewedBy ? 'req.reviewed_by' : 'NULL';
    $approvedByExpr = $hasApprovedBy ? 'req.approved_by' : 'NULL';

    $stmt = $conn->prepare(
        "SELECT
            req.dispute_id AS source_id,
            req.created_at AS filed_at,
            req.dispute_type AS request_type,
            req.reason AS details,
            req.dispute_date AS schedule_period,
            req.status,
            COALESCE($ebFullNameExpr, eb_u.$userDisplayColumnName, eb_u.$userSecondaryColumnName, '') AS endorsed_by_name,
            COALESCE($abFullNameExpr, ab_u.$userDisplayColumnName, ab_u.$userSecondaryColumnName, '') AS approved_by_name
         FROM attendance_disputes req
         LEFT JOIN users eb_u ON eb_u.$usersIdColumnName = $reviewedByExpr
         LEFT JOIN employees eb_emp ON eb_emp.user_id = eb_u.$usersIdColumnName
         LEFT JOIN users ab_u ON ab_u.$usersIdColumnName = $approvedByExpr
         LEFT JOIN employees ab_emp ON ab_emp.user_id = ab_u.$usersIdColumnName
         WHERE req.employee_id = ?"
    );
    $stmt->bind_param('i', $employeeId);
    $stmt->execute();
    $res = $stmt->get_result();
    while ($row = $res->fetch_assoc()) {
        $actionMeta = resolveRequestActionLog($conn, 'dispute', $row);
        $items[] = [
            'id' => 'dispute-' . $row['source_id'],
            'request_source' => 'dispute',
            'date_filed' => $row['filed_at'],
            'request_type' => $row['request_type'] ?: 'Attendance Dispute',
            'details' => $row['details'] ?: '—',
            'schedule_period' => $row['schedule_period'] ?: '—',
            'status' => $row['status'] ?: 'Pending',
            'endorsed_by_name' => $row['endorsed_by_name'],
            'approved_by_name' => $row['approved_by_name'],
            'request_action_at' => $actionMeta['request_action_at'],
            'request_action_label' => $actionMeta['request_action_label']
        ];
    }
}

usort($items, function ($a, $b) {
    $left = strtotime((string)($a['date_filed'] ?? ''));
    $right = strtotime((string)($b['date_filed'] ?? ''));
    return $right <=> $left;
});

echo json_encode($items);