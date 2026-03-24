import { Clock, CheckCircle2, AlertCircle, ArrowUpRight, FileText, CheckCircle, XCircle } from 'lucide-react';

/**
 * Common highlight IDs for filtering
 */
export const HIGHLIGHT_IDS = {
  TOTAL_HOURS: 'total-hours',
  DAYS_PRESENT: 'days-present',
  TOTAL_LATE: 'total-late',
  OVERTIME: 'overtime',
  TOTAL_REQUESTS: 'total-requests',
  PENDING: 'pending',
  APPROVED: 'approved',
  REJECTED: 'rejected'
};

/**
 * Builds highlight cards for attendance records (My Attendance / All Attendance)
 * @param {Array} records - Normalized or raw attendance records
 */
export function buildAttendanceHighlights(records = []) {
  const totals = (Array.isArray(records) ? records : []).reduce((acc, row) => {
    const hours = parseFloat(row?.total_hours ?? 0);
    const status = String(row?.status ?? row?.attendance_tag ?? row?.tag ?? "").toLowerCase();
    const date = row?.date ?? row?.time_in_at?.slice(0, 10);
    const userId = row?.user_id ?? row?.employee_id ?? "unknown";

    acc.totalHours += hours;
    
    if (date && (status.includes("present") || status.includes("approved") || status.includes("on time") || status.includes("late"))) {
      acc.daysPresent.add(`${userId}-${date}`);
    }

    if (status.includes("late")) acc.totalLate += 1;
    if (status.includes("overtime") || status.includes("over time")) acc.overtime += 1;
    
    return acc;
  }, {
    totalHours: 0,
    daysPresent: new Set(),
    totalLate: 0,
    overtime: 0
  });

  return [
    { 
      key: HIGHLIGHT_IDS.TOTAL_HOURS, 
      label: "Total Hours", 
      icon: Clock, 
      accentClass: "is-slate", 
      value: totals.totalHours.toFixed(2), 
      subValue: "Calculated from logs" 
    },
    { 
      key: HIGHLIGHT_IDS.DAYS_PRESENT, 
      label: "Days Present", 
      icon: CheckCircle2, 
      accentClass: "is-green", 
      value: totals.daysPresent.size, 
      subValue: "Logged attendance days" 
    },
    { 
      key: HIGHLIGHT_IDS.TOTAL_LATE, 
      label: "Total Late", 
      icon: AlertCircle, 
      accentClass: "is-amber", 
      value: totals.totalLate, 
      subValue: "Requires attention" 
    },
    { 
      key: HIGHLIGHT_IDS.OVERTIME, 
      label: "Overtime", 
      icon: ArrowUpRight, 
      accentClass: "is-blue", 
      value: totals.overtime, 
      subValue: "Tagged overtime logs" 
    },
  ];
}

/**
 * Builds highlight cards for file requests (My Requests / Team Requests)
 * @param {Array} requests - File request records
 */
export function buildRequestHighlights(requests = []) {
  const totals = (Array.isArray(requests) ? requests : []).reduce(
    (acc, item) => {
      const status = String(item.status ?? "").toLowerCase();
      acc.total += 1;
      if (status.includes("pending") || status.includes("endorsed")) acc.pending += 1;
      if (status.includes("approve")) acc.approved += 1;
      if (status.includes("reject") || status.includes("deny")) acc.rejected += 1;
      return acc;
    },
    { total: 0, pending: 0, approved: 0, rejected: 0 }
  );

  return [
    { 
      key: HIGHLIGHT_IDS.TOTAL_REQUESTS, 
      label: "Total Requests", 
      icon: FileText, 
      accentClass: "is-slate", 
      value: totals.total, 
      subValue: "All filings" 
    },
    { 
      key: HIGHLIGHT_IDS.PENDING, 
      label: "Pending", 
      icon: Clock, 
      accentClass: "is-blue", 
      value: totals.pending, 
      subValue: "Awaiting review" 
    },
    { 
      key: HIGHLIGHT_IDS.APPROVED, 
      label: "Approved", 
      icon: CheckCircle, 
      accentClass: "is-green", 
      value: totals.approved, 
      subValue: "Completed" 
    },
    { 
      key: HIGHLIGHT_IDS.REJECTED, 
      label: "Rejected", 
      icon: XCircle, 
      accentClass: "is-red", 
      value: totals.rejected, 
      subValue: "Needs update" 
    }
  ];
}
