# Plan: Show Request Filed, Endorsed, and Approved Names

Update the request table columns in the Coach and Admin dashboards to show the names of the people who filed, endorsed, and approved each request.

## Objective
The goal is to modify the Coach and Admin "Team Request" tables to show:
-   **Filed By**: The name of the person who submitted the request.
-   **Endorsed By**: The name of the coach who endorsed the request (if applicable).
-   **Approved By**: The name of the admin who approved/finalized the request (if applicable).

## Key Files & Context
-   `backend/api/coach/coach_team_requests.php`: Fetches team requests for coaches.
-   `backend/api/admin/admin_team_requests.php`: Fetches team requests for admins.
-   `frontend/src/components/DataPanel.jsx`: Displays the table with the request records.

## Implementation Steps

### 1. Update Backend APIs
-   **Modify `backend/api/coach/coach_team_requests.php` and `backend/api/admin/admin_team_requests.php`**:
    -   Update the `SELECT` query in `$loadRequests` to fetch `reviewed_by` and `approved_by` (if they exist).
    -   Add `JOIN` statements with `users` and `employees` (aliased as `endorser` and `approver`) to get the names of the people who endorsed and approved.
    -   Include `endorsed_by_name` and `approved_by_name` in the results array.

### 2. Update `DataPanel.jsx`
-   **Update `panelConfig.requests.columns`**:
    -   Add "Filed By", "Endorsed By", and "Approved By" to the columns list.
-   **Update sorting and filtering**:
    -   Ensure the new columns are sortable.
-   **Update rendering logic**:
    -   In the `requests` table body, render the "Filed By", "Endorsed By", and "Approved By" cells.
    -   Since the `employee_name` already shows who filed, I'll rename the "Person" column to "Filed By".
    -   I'll update the `showRequestActionBy` logic to use these new fields.

## Verification & Testing
1.  **Manual Verification**:
    -   Log in as a **Coach**.
    -   Go to "Team Requests".
    -   Verify the table shows "Filed By", "Endorsed By", and "Approved By" columns.
    -   Verify that the names are correctly displayed for existing requests.
    -   Log in as an **Admin**.
    -   Go to "All Requests" / "Team Requests".
    -   Verify the same columns are visible and populated.
2.  **API Verification**:
    -   Check the network tab to ensure `coach_team_requests.php` and `admin_team_requests.php` are returning the correct `endorsed_by_name` and `approved_by_name` fields.
