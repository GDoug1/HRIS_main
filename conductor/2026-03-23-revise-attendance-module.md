# Plan: Revise "My Attendance" Table (AttendanceModule.jsx)

Upgrade `AttendanceModule.jsx` to be as functional and aesthetically consistent as the `DataPanel.jsx` component.

## Objective
The goal is to modify the "My Attendance Logs" table in `AttendanceModule.jsx` to include:
-   **Full Sorting**: Add sortable headers for Date, Time In, Time Out, Total Hours, and Status.
-   **Advanced Search**: Expand search to cover all table fields.
-   **Functional Date Range Filter**: Replace the placeholder button with actual `from` and `to` date inputs.
-   **Consistent UI**: Align the styling, iconography, and interactions with the standard application patterns.

## Key Files & Context
-   `frontend/src/components/AttendanceModule.jsx`: The component responsible for the employee's attendance history view.
-   `frontend/src/styles/AttendanceModule.css`: Styles for the attendance module.
-   `frontend/src/components/DataPanel.jsx`: The reference component for "functional" tables.

## Implementation Steps

### 1. Update `AttendanceModule.jsx`
-   **Add Sort State**: Introduce `sortKey` and `sortDirection` states.
-   **Implement `SortableHeader`**: Create or import a `SortableHeader` component (similar to `DataPanel.jsx`).
-   **Implement Full Search & Date Range Filtering**:
    -   Add `dateStartFilter` and `dateEndFilter` states.
    -   Update the filtering logic in `useMemo` to include date range and multi-field search.
-   **Implement Sorting Logic**:
    -   Add a `handleSort` function.
    -   Update the `filteredData` `useMemo` to sort the results based on the current `sortKey` and `sortDirection`.
-   **UI Refinement**:
    -   Replace the `am-toolbar-actions` placeholder with the standard date and search inputs.
    -   Ensure the table headers use the `SortableHeader` component.

### 2. Update `AttendanceModule.css` (if needed)
-   Ensure the new sorting icons and date inputs are correctly styled and responsive.

## Verification & Testing
1.  **Manual Verification**:
    -   Log in as an **Employee**.
    -   Go to "My Attendance".
    -   Verify that clicking on table headers (Date, Time In, etc.) sorts the records correctly in both ascending and descending order.
    -   Enter a date range in the "From" and "To" fields and verify that the table only shows records within that range.
    -   Type a status (e.g., "Late") or a partial date in the search bar and verify that it filters correctly.
    -   Change the "Rows per page" and verify that pagination updates as expected.
    -   Verify that the "Dispute" button still works correctly for individual rows.
