# Revised QA Remediation & Upstream Merge Strategy

## 🎯 Objective
This plan outlines the specific technical steps required to resolve the **36 QA failures** identified in the Attendance M3 Workbook while maintaining synchronization with the main `GDoug1/team-cluster2` repository.

---

## 🛠️ Implementation Tasks (Mapped to QA cases)

### Task 1: Admin Attendance & Stats Persistence (Cases 6, 8, 13, 14, 15)
*   **Action:** Hoist `attendanceLog` state to `AdminDashboard.jsx`.
*   **Action:** Pass `attendanceControls` to `MainDashboard` via props.
*   **Action:** Implement `handleAdminTimeIn` and `handleAdminTimeOut` using the `saveAdminDashboardAttendance` API.
*   **Action:** Calculate and pass `totalHours` and `presentCount` (from `coachAttendance` records) to the dashboard summary cards.

### Task 2: Filing Center UI & Validation (Cases 10, 11, 18, 19, 24, 29)
*   **Action:** Add a persistent informational header in `FilingCenterPanel.jsx` showing: *"Filing as member of [Cluster Name] under [Coach Name]"*.
*   **Action:** Add a required **Agreement Checkbox** at the bottom of the form: `[ ] I certify that the information provided is true and correct.`
*   **Action:** Block the `Submit` button until the checkbox is checked.

### Task 3: Data Table Refinement (Cases 23, 26, 27, 32, 34)
*   **Action:** Update `formatDateTimeLabel` in `DataPanel.jsx` to use `month: "long"` (e.g., "March 22, 2026").
*   **Action:** Add an `Employee` column to the `requests` table view in `DataPanel.jsx` to show who filed the request (Case 23).
*   **Action:** Replace text buttons ("Accept"/"Reject") with **Lucide Icons** (Check/X) and align them to the right of the cell (Case 27).
*   **Action:** Add an `Processed Date` column to show when a request was approved or rejected (Case 32).
*   **Action:** (Optional) Wrap the Status pill in a `title` attribute or tooltip showing the reviewer's name (Case 34).

### Task 4: Cluster Member Visibility (Case 9)
*   **Action:** In the Admin "Team" view, ensure the "Members" count is clickable or provides a dropdown to see the actual list of users within that cluster.

---

## 🧪 Verification Protocol
1.  **Persistence Test:** Log in as Admin -> Time In -> Switch to "Team" tab -> Return to "Dashboard". Clock must still be running.
2.  **Date Test:** View any table with a date. It must show the full month name.
3.  **Filing Test:** Open Filing Center. It must show your Cluster/Coach name and require an agreement check.
4.  **Action UI Test:** View "File Request" as Admin. Approval actions should be icons on the right.
