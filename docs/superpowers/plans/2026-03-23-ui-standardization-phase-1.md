# UI Standardization Phase 1: Design Foundations Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Establish a 4px-based spacing grid and standardized color tokens in `app.css`.

**Architecture:** Use CSS Variables (Custom Properties) at the `:root` level to define design tokens, then refactor existing global utility classes (`.btn`, `.card`, `.form-field`) to consume these tokens.

**Tech Stack:** Vanilla CSS.

---

### Task 1: Initialize Global Tokens in `app.css`

**Files:**
- Modify: `frontend/src/styles/app.css`

- [ ] **Step 1: Inject `:root` tokens**
Add the following to the top of `app.css`:
```css
:root {
  /* Colors */
  --primary: #3b82f6;
  --primary-hover: #2563eb;
  --primary-soft: #dbeafe;
  --secondary: #64748b;
  --secondary-hover: #475569;
  --danger: #ef4444;
  --danger-hover: #dc2626;
  --success: #22c55e;
  --warning: #f59e0b;
  
  /* Surfaces */
  --bg-main: #f8fafc;
  --bg-card: #ffffff;
  --border-light: #e2e8f0;
  --border-strong: #cbd5e1;
  
  /* Typography */
  --text-main: #0f172a;
  --text-muted: #64748b;
  --text-inverse: #ffffff;
  
  /* Spacing Grid (4px base) */
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-5: 20px;
  --space-6: 24px;
  --space-8: 32px;
  
  /* Effects */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
}
```

- [ ] **Step 2: Commit**
```bash
git add frontend/src/styles/app.css
git commit -m "style: initialize global design tokens in app.css"
```

---

### Task 2: Standardize Button Base Styles

**Files:**
- Modify: `frontend/src/styles/app.css`

- [ ] **Step 1: Refactor `.btn` and variants**
Update the button styles to use tokens:
```css
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: var(--space-2) var(--space-4);
  font-size: 14px;
  font-weight: 600;
  border-radius: var(--radius-md);
  transition: all 0.2s ease;
  cursor: pointer;
  border: 1px solid transparent;
  gap: var(--space-2);
}

.btn.primary {
  background: var(--primary);
  color: var(--text-inverse);
}

.btn.primary:hover:not(:disabled) {
  background: var(--primary-hover);
}

.btn.secondary {
  background: var(--bg-card);
  border-color: var(--border-light);
  color: var(--text-muted);
}

.btn.secondary:hover:not(:disabled) {
  background: var(--bg-main);
  color: var(--text-main);
}

.btn.danger {
  background: var(--danger);
  color: var(--text-inverse);
}

.btn-action-soft {
  background: var(--primary-soft);
  color: var(--primary);
  border: 1px solid transparent;
  padding: var(--space-1) var(--space-3);
  font-size: 13px;
  font-weight: 600;
  border-radius: var(--radius-sm);
  cursor: pointer;
  transition: all 0.2s;
}

.btn-action-soft:hover {
  background: var(--primary);
  color: var(--text-inverse);
}
```

- [ ] **Step 2: Commit**
```bash
git add frontend/src/styles/app.css
git commit -m "style: standardize button components using design tokens"
```

---

### Task 3: Standardize Card and Spacing Utilities

**Files:**
- Modify: `frontend/src/styles/app.css`

- [ ] **Step 1: Update `.card` and layout spacing**
```css
.card {
  background: var(--bg-card);
  border: 1px solid var(--border-light);
  border-radius: var(--radius-lg);
  padding: var(--space-4);
  box-shadow: var(--shadow-sm);
}

/* Global Content Padding */
.content {
  padding: var(--space-6) var(--space-8);
}

@media (max-width: 768px) {
  .content {
    padding: var(--space-4);
  }
}
```

- [ ] **Step 2: Commit**
```bash
git add frontend/src/styles/app.css
git commit -m "style: standardize card and content layout spacing"
```
