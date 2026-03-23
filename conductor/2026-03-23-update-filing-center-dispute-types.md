# Plan: Update Filing Center Dispute Types

Update the dropdown options for attendance disputes in `FilingCenterPanel.jsx` as per the user's request.

## Objective
The goal is to modify the attendance dispute dropdown in the "Filing Center" to include the following options:
- Forget time in/out
- System error
- Official business
- Incorrect status
- Breaktime
- Lunch break

## Key Files & Context
- `frontend/src/components/FilingCenterPanel.jsx`: This component handles the UI for filing various types of requests, including attendance disputes.

## Implementation Steps
1.  **Modify `frontend/src/components/FilingCenterPanel.jsx`**:
    -   Update the initial state of `disputeType` to "Forget time in/out".
    -   Update the `<select id="dispute-type">` dropdown to include the new options and remove the old ones ("Time Correction", "Status Discrepancy", "Missing Log").

## Verification & Testing
1.  **Manual Verification**:
    -   Open the "Filing Center" in the application.
    -   Navigate to the "Attendance Dispute" tab.
    -   Verify that the "Dispute Type" dropdown contains the new options:
        -   Forget time in/out
        -   System error
        -   Official business
        -   Incorrect status
        -   Breaktime
        -   Lunch break
    -   Select each option to ensure the state updates correctly.
    -   Submit a test dispute to ensure it is correctly processed by the backend.
