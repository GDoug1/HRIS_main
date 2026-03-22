# Attendance Module - Comprehensive QA Traceability Matrix

This document provides a full trace of the 36 QA test cases identified in the **Attendance M3 QA Testing WorkBook**. It tracks the functional, UI, and logic requirements for the Attendance and Request modules.

**Database in use:** `system_hris_db`

## 📊 QA Test Case Table

| ID | FEATURE | SCENARIO | TEST STEPS | EXPECTED RESULTS / FINDINGS | STATUS | TEST DATE | TESTER NAME |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **1** | ADMIN | Request Table | Display request type | Request type should be visible and clear | Types displayed correctly | Completed | Ian Deza |
| **2** | ADMIN | Request Table | Display schedule format | Schedule/Period should have consistent date format | Consistent date formatting required | Completed | Ian Deza |
| **3** | ADMIN | Request Table | Manage requests | User should have options like View, Edit, or Cancel | Action buttons available in table | Completed | Ian Deza |
| **4** | ADMIN | Request Table | Display submitted requests | All submitted requests should appear in the table | Requests appear in the table | Completed | Ian Deza |
| **5** | ADMIN | Schedule Display | My Requests dates | Creating a schedule | Schedule Display | Completed | Ian Deza |
| **6** | ADMIN | Dashboard Summary | Statistics not displaying | System calculates totals | Dashboard needs revisions | Need Revisions | Ian Deza |
| **7** | ADMIN | Request Dashboard | Display request statuses | Include all statuses used in system | "Endorsed" status is shown | Completed | Ian Deza |
| **8** | ADMIN | ATTENDANCE | Time In/Out Persistence | Navigation should not reset state | Resets to Time In on page change | Need Revisions | Ian Deza |
| **9** | ADMIN | ATTENDANCE | Team coach cluster members | Display of each team coach member | Doesn't have display of each | Need Revisions | Kenneth De Vera |
| **10** | EMPLOYEE | Disputes | Display coach and cluster | Auto-detect coach and cluster | Doesn't have auto-detect UI | Need Revisions | Kenneth De Vera |
| **11** | ALL | Request | Confirm agreements | Agreement checkbox display | No agreement to display | Need Revisions | Kenneth De Vera |
| **12** | ADMIN | Team Request | Display team request | Resolve CORS policy issues | No display due to CORS | Need Revisions | Kenneth De Vera |
| **13** | ALL | Attendance | Persistence: Cross-Tab Nav | Navigate while Timed In | Counter should remain active | Not Yet Started | 3/17/2026 |
| **14** | ALL | Attendance | Persistence: Session Recovery | Refresh browser (F5) | Restore counter on load | Not Yet Started | 3/17/2026 |
| **15** | ALL | Attendance | Dashboard Stats Accuracy | Observe Total Hours | Accurate real-time increments | Not Yet Started | 3/17/2026 |
| **16** | COACH | Attendance | Team Member Visibility | Navigate to Cluster Attendance | List all active members | Not Yet Started | 3/17/2026 |
| **17** | COACH | Attendance | Dynamic Member Status | View Member Status card | Real-time member updates | Not Yet Started | 3/17/2026 |
| **18** | EMPLOYEE | Filing Center | Auto-detect Coach/Cluster | Open Dispute or OT form | Fields pre-filled automatically | Not Yet Started | 3/17/2026 |
| **19** | ALL | Request | Agreement Confirmation | Submit without agreement | Block submission | Not Yet Started | 3/17/2026 |
| **20** | EMPLOYEE | ATTENDANCE | Late Tag Calculation | Time In at 9:16 AM | Tag as "Late" (15m grace) | Not Yet Started | 3/17/2026 |
| **21** | COACH | Team Request | CORS Policy Check | Navigate to Team Request | No CORS errors in console | Not Yet Started | 3/17/2026 |
| **22** | EMPLOYEE | ATTENDANCE | Overlapping Logs | Trigger "Time In" again | Prevent duplicate active logs | Not Yet Started | 3/17/2026 |
| **23** | ALL | Request | Display employee name | Table must show requester | Needed for table clarity | Need Revisions | |
| **24** | ALL | Agreement | Confirmation for filing | Requirement for display | Not on display | Need Revisions | 3/20/2026 |
| **25** | ALL | Modal confirmation | Display after action click | Prompt for user confirmation | Not on display | Need Revisions | 3/20/2026 |
| **26** | ALL | Dates | Format: mmmm/dddd/yyyy | Letters for months (e.g. March) | Current uses numerical/short | Need Revisions | 3/20/2026 |
| **27** | ALL | Request | Icon for approval | Must be icon on the right | Currently button, not icon | Need Revisions | 3/20/2026 |
| **28** | Filing Center | Details Window | View content of leave | Details in small window | View content functional | Completed | Sir Dave |
| **29** | Filing Center | Filing agreement | Check box agreement | Checklist to validate | Missing check box | Missing | Sir Dave |
| **30** | Filing Center | Confirmation for leave | Photo evidence upload | Upload button for evidence | Photo upload functional | Completed | Sir Dave |
| **31** | Request | Endorse/Reject button | Confirm and reject validation | Reject button required | Reject button functional | Completed | Sir Dave |
| **32** | Request | Date accepted/rejected | View dates for approved filing | View filing content | Needs revisions | Need Revisions | Sir Dave |
| **33** | Request | Date restrictions | Prevent previous date selection | Date restriction functional | Restricted | Completed | Sir Dave |
| **34** | Request | Status clickable | View user who rejected/approved | Clickable status to view user | Missing links | Missing | Sir Dave |
| **35** | ALL | Default records | Pagination (20/25/100) | View editable record counts | Pagination controls added | Completed | Sir Dave |
| **36** | ALL | Confirmation | Confirmation pop out | Modal for action confirmation | Pop out functional | Completed | Sir Dave |

---

## 🛠️ Revision Notes for Implementation

1.  **Persistence (Cases 8, 13, 14):** Ensure the `attendanceLog` state is hoisted to the dashboard parent component (`AdminDashboard.jsx`, `CoachDashboard.jsx`) to prevent resets during SPA navigation.
2.  **Date Formatting (Case 26):** Update the frontend `formatDateTimeLabel` utility to use `month: "long"` to meet the "March" vs "Mar" requirement.
3.  **UI Consistency (Case 27):** Replace "Endorse" and "Reject" text buttons in `DataPanel.jsx` with icons aligned to the right.
4.  **Legal/Policy (Cases 11, 19, 24, 29):** Implement the mandatory "Agreement" checkbox in the Filing Center to block unauthorized submissions.
