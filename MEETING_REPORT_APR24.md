# PrimBooks QA Meeting Report
## April 24, 2026

**Prepared by:** Azeez Test Lab  
**Sprint Coverage:** CRM & Record Module Retest + Purchase Module Audit  
**Bug Tracker:** [Live Dashboard](https://azeeztestlab.github.io/Primbooks_smoke_test/bug_tracker.html)

---

## 1. CRM & Record Module — Retest Summary

Following the development team's fixes, a full regression retest was performed on all previously reported CRM and Record module bugs (PB-001 through PB-022). The majority of issues have been successfully resolved and are now **Closed**.

### Closure Results

| Ticket | Feature | Previous Status | Current Status |
|---|---|---|---|
| PB-001 | Customer List — Refresh Required | Open | ✅ **Closed** |
| PB-002 | Credit Note — Issue Date | Fixed | ✅ **Closed** |
| PB-003 | Order/Invoice — Payment Date | Fixed | ✅ **Closed** |
| PB-004 | Record — Opening Balance Negative Value | Open | ✅ **Closed** |
| PB-005 | Record — Selling Price Negative Value | Open | ✅ **Closed** |
| PB-006 | Order — Discount Display | Open | ✅ **Closed** |
| PB-007 | Invoice — Leading Zero in Discount | Fixed | ✅ **Closed** |
| PB-008 | Order — Quantity Leading Zero | Open | ✅ **Closed** |
| PB-009 | Invoice — Validation Error on Create | Fixed | ✅ **Closed** |
| PB-010 | Quotation — Payment Date Default | Fixed | ✅ **Closed** |
| PB-011 | Quotation — Delete Modal Blocks UI | Open | ✅ **Closed** |
| PB-014 | Quotation — Column Alignment | Open | ✅ **Closed** |
| PB-015 | Invoice — Balance Due Shows ₦0.00 | Open | ✅ **Closed** |
| PB-017 | Invoice — Column Alignment | Open | ✅ **Closed** |
| PB-018 | Invoice — Watermark Shows "SENT" | Open | ✅ **Closed** |
| PB-019 | Discount — Negative % Increases Total | Open | ✅ **Closed** |
| PB-020 | Quantity — Negative Input Concatenation | Open | ✅ **Closed** |
| PB-021 | Record — Service Unit Selection | Open | ✅ **Closed** |
| PB-022 | Dashboard — Balance Sheet Ghost Amount | Fixed | ✅ **Closed** |

> **19 of 22 bugs successfully closed after retest.**

### Regressions Found

Two previously closed Quotation bugs have **resurfaced** and were reopened:

| Ticket | Feature | Issue |
|---|---|---|
| PB-012 🔴 | CRM — Quotation | Customer Notes & Terms and Conditions do not reflect on View Quotation |
| PB-013 🔴 | CRM — Quotation | Issue Date not showing / shows invalid date on View Quotation |

> [!WARNING]
> These are regressions — both PB-012 and PB-013 were previously closed but the bugs have returned. The Quotation view rendering needs attention from the frontend team.

### Remaining Open (CRM)

| Ticket | Feature | Severity | Team |
|---|---|---|---|
| PB-012 | Quotation — Customer Notes/T&C Not Reflecting | Medium | Frontend |
| PB-013 | Quotation — Invalid/Missing Date on View | Medium | Frontend |
| PB-016 | Invoice — Discount Shows as ₦ Instead of % | Low | Frontend |

---

## 2. Purchase Module — New Audit

Testing has been extended to the **Purchase module**, covering **Vendor Management**, **One-Time Expenses**, and **Recurring Expenses**. This is the first QA pass on these features.

### Test Summary

| Metric | Count |
|---|---|
| Test Cases Executed | 14 |
| Passed | 8 |
| Failed | 6 |
| New Bugs Logged | 4 |

### What Works Well ✅

- **Vendor creation flow** — Form validation for empty fields works correctly
- **Vendor ↔ Expense integration** — Newly created vendors immediately appear in expense dropdown selectors
- **Item Breakdown auto-calculation** — Grand Total computes correctly from line items
- **Recurring Expense frequency options** — Daily/Monthly frequency and auto-calculated end dates populate

### New Bugs Found

| Ticket | Severity | Module | Description |
|---|---|---|---|
| **PB-023** | Medium | Vendor | **Duplicate email allowed** — System creates multiple vendors with identical email addresses without any validation or warning |
| **PB-024** | Low | Recurring Expenses | **End date off by +1 day** — For 12 daily occurrences starting Apr 23, end date shows May 05 instead of the correct May 04 |
| **PB-025** | 🔴 High | Expenses | **Save button frequently unresponsive** — Despite all fields being filled, the Save/Create buttons fail to register clicks. Users must scroll, re-select dropdowns, and click repeatedly |
| **PB-026** | Medium | Expenses | **Negative amount accepted** — The Amount field accepts negative values (e.g. -50000) without validation, consistent with PB-004/PB-005 pattern |

> [!IMPORTANT]
> **PB-025 (Save Button Unresponsive)** is the highest-priority issue. It severely impacts the ability to create expenses and recurring expenses. This may be related to the persistent "1 Issue" overlay at the bottom-left corner intercepting click events.

---

## 3. Overall Bug Tracker Status

| Status | Count | Tickets |
|---|---|---|
| 🔴 **Open** | 7 | PB-012, PB-013, PB-016, PB-023, PB-024, PB-025, PB-026 |
| ✅ **Closed** | 19 | PB-001 to PB-011 (excl. 012/013), PB-014, PB-015, PB-017 to PB-022 |
| **Total** | 26 | — |

### Resolution Rate

```
████████████████████░░░░░  73% Resolved (19/26)
```

### Severity Breakdown (Open Bugs)

| Severity | Count | Tickets |
|---|---|---|
| 🔴 High | 1 | PB-025 |
| 🟡 Medium | 4 | PB-012, PB-013, PB-023, PB-026 |
| 🟢 Low | 2 | PB-016, PB-024 |

### Team Assignment (Open Bugs)

| Team | Count | Tickets |
|---|---|---|
| **Frontend** | 4 | PB-012, PB-013, PB-016, PB-025 |
| **Backend** | 3 | PB-023, PB-024, PB-026 |

---

## 4. Recommendations & Next Steps

1. **Priority Fix — PB-025:** The unresponsive Save button in Purchase > Expenses is blocking normal workflow. Recommend the frontend team investigate whether the "1 Issue" overlay or a form validation state is intercepting click events.

2. **Quotation Regressions — PB-012 & PB-013:** These were previously fixed and have resurfaced. Suggest reviewing recent Quotation view commits for unintended side effects.

3. **Negative Value Pattern:** PB-026 (Expense amount) follows the same pattern as PB-004 (Opening Balance) and PB-005 (Selling Price). A global input sanitization approach for all monetary fields would prevent similar issues across modules.

4. **Next Audit Target:** Reports module (P&L, Balance Sheet, Equity, General Ledger, Trial Balance, Cashflow, Bank Ledger) — scheduled for the next testing cycle.

---

**Live Bug Tracker:** [azeeztestlab.github.io/Primbooks_smoke_test/bug_tracker.html](https://azeeztestlab.github.io/Primbooks_smoke_test/bug_tracker.html)
