# Accessibility & UI Consistency Implementation Plan (Approach A)

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Standardize date formatting, implement high-contrast themed confirmation modals, and enhance screen reader support for the Attendance and Request modules.

**Architecture:** Centralize date formatting logic in a new utility, enhance the `FeedbackProvider` with themed variants, and apply surgical UI/ARIA updates to core components.

**Tech Stack:** React 19, Lucide React (Icons), Vanilla CSS.

---

### Task 1: Centralized Date Utility

**Files:**
- Create: `frontend/src/utils/dateUtils.js`
- Test: Create `frontend/src/utils/__tests__/dateUtils.test.js` (Manual verification script if no test runner)

- [ ] **Step 1: Create the date utility file**

```javascript
// frontend/src/utils/dateUtils.js

export const formatFullDate = (value) => {
  if (!value) return "—";
  // Support both "YYYY-MM-DD HH:MM:SS" and standard Date objects
  const date = new Date(String(value).replace(" ", "T"));
  if (isNaN(date.getTime())) return "—";
  
  return date.toLocaleDateString("en-US", {
    weekday: "short", // "Mon"
    month: "long",    // "March"
    day: "numeric",   // "23"
    year: "numeric"   // "2026"
  });
};

export const formatDateTime = (value) => {
  const dateStr = formatFullDate(value);
  if (dateStr === "—") return dateStr;
  
  const date = new Date(String(value).replace(" ", "T"));
  const timeStr = date.toLocaleTimeString("en-US", {
    hour: "numeric",
    minute: "2-digit"
  });
  
  return `${dateStr} at ${timeStr}`;
};
```

- [ ] **Step 2: Commit utility**

```bash
git add frontend/src/utils/dateUtils.js
git commit -m "feat: add centralized dateUtils for consistent formatting"
```

---

### Task 2: Enhanced FeedbackProvider Variants

**Files:**
- Modify: `frontend/src/components/FeedbackProvider.jsx`
- Modify: `frontend/src/styles/app.css`

- [ ] **Step 1: Update CSS with high-contrast variants**

```css
/* frontend/src/styles/app.css */

.confirm-modal-btn.is-danger {
  background: #D93025; /* WCAG AA Red */
  color: #FFFFFF;
  border: 1px solid #a5241c;
}

.confirm-modal-btn.is-danger:hover {
  background: #b71c1c;
}

.confirm-modal-btn.is-primary {
  background: #357AF4; /* WCAG AA Blue */
  color: #FFFFFF;
  border: 1px solid #285ec1;
}
```

- [ ] **Step 2: Update FeedbackProvider logic**

```javascript
// frontend/src/components/FeedbackProvider.jsx

// Update confirm function signature
const confirm = ({ title, message, confirmLabel = "Confirm", variant = "primary" }) => {
  // ... existing state logic ...
  // Ensure the rendered button uses the variant class:
  // <button className={`confirm-modal-btn is-${variant}`}>...
}
```

- [ ] **Step 3: Commit FeedbackProvider changes**

```bash
git add frontend/src/components/FeedbackProvider.jsx frontend/src/styles/app.css
git commit -m "feat: add high-contrast variants to FeedbackProvider confirmation modals"
```

---

### Task 3: DataPanel Action & Date Refinement

**Files:**
- Modify: `frontend/src/components/DataPanel.jsx`

- [ ] **Step 1: Import date utility and update formatting**

```javascript
import { formatFullDate, formatDateTime } from "../utils/dateUtils";
// Replace local formatDateTimeLabel and formatRequestActionDate with imports
```

- [ ] **Step 2: Update action buttons with ARIA and confirmation**

```javascript
// Inside DataPanel.jsx rows
<button
  className={`${action.variant ?? "btn"} action-icon-btn ${action.status === "Denied" ? "danger" : ""}`}
  aria-label={`${action.label} for ${item.employee_name || "request"}`}
  onClick={() => {
    const variant = action.status === "Denied" ? "danger" : "primary";
    confirm({
      title: `${action.label}?`,
      message: `Are you sure you want to ${action.label.toLowerCase()} this request?`,
      confirmLabel: action.label,
      variant
    }).then(ok => ok && onRequestAction(item, action.status));
  }}
>
  {/* Icon with aria-hidden="true" */}
</button>
```

- [ ] **Step 3: Commit DataPanel changes**

```bash
git add frontend/src/components/DataPanel.jsx
git commit -m "feat: enhance DataPanel with icon-based actions, ARIA labels, and confirmations"
```

---

### Task 4: Dashboard Integration

**Files:**
- Modify: `frontend/src/pages/CoachDashboard.jsx`
- Modify: `frontend/src/pages/AdminDashboard.jsx`

- [ ] **Step 1: Update date formatting in Dashboards**
- [ ] **Step 2: Add confirmation to Time Out actions**
- [ ] **Step 3: Commit Dashboard changes**

```bash
git add frontend/src/pages/CoachDashboard.jsx frontend/src/pages/AdminDashboard.jsx
git commit -m "feat: apply standardized date formatting and confirmations to main dashboards"
```
