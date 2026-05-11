# PrimBooks — Purchase Module Functional Test Report

**QA Lead:** Azeez Test Lab  
**Date:** May 1, 2026  
**Environment:** localhost:3000 | Gundro Nodes Inc | Admin  
**Scope:** Vendors, Expenses, Recurring Expenses, Data Integrity, Reports

---

## Executive Summary

The Purchase module has seen significant bug fixes since the last test cycle. **2 previously open bugs are now FIXED** (PB-023, PB-026), **1 remains confirmed** (PB-027), and **2 new bugs were discovered** (PB-028, PB-029). The module is **functional for basic expense tracking** but has gaps in vendor management (no delete) and recurring expense calculations.

---

## 1. Vendor Module

### Test Results

| Test Case | Action | Result | Status |
|:---|:---|:---|:---:|
| VND-001 | View vendor list | 3 existing vendors displayed with correct columns (Name, Phone, Email, Status, Amount Spent) | ✅ PASS |
| VND-002 | Create vendor with valid data | "QA Test Vendor Alpha" created successfully (qa.alpha@test.com, 08011112222) | ✅ PASS |
| VND-003 | Create vendor with DUPLICATE email | System correctly rejects with "Email already exists" error | ✅ PASS |
| VND-004 | Create vendor with unique email | "QA Test Vendor Beta" created (qa.beta@test.com) | ✅ PASS |
| VND-005 | Edit vendor (change phone) | Phone updated from 08011112222 to 09099998888 successfully | ✅ PASS |
| VND-006 | Delete vendor | **No Delete option available.** Action menu only shows: View, Edit, Mark Inactive | ❌ FAIL |
| VND-007 | Empty form validation | System requires Vendor Name to proceed | ✅ PASS |
| VND-008 | Vendor form structure | Multi-tab form: Main Info, Other Info (Payment Terms, Debit/Credit), Address | ✅ PASS |

### Bug Status Updates
- **PB-023 (Duplicate Email):** ✅ **FIXED** — System now properly validates and rejects duplicate vendor emails

### New Bug Found
- **PB-028: Vendor — No Delete Option** — Vendors cannot be deleted from the system. Only "Mark Inactive" is available. While soft-delete is acceptable in some contexts, there should be an option to permanently remove test/error vendors.

---

## 2. Expense Module

### Test Results

| Test Case | Action | Result | Status |
|:---|:---|:---|:---:|
| EXP-001 | View expense list | Displays correctly with tabs (All Expenses, Unpaid, Paid) and columns (Purchase ID, Date, Vendor, Amount, Balance, Status) | ✅ PASS |
| EXP-002 | Create expense with all required fields + "Paid Through" | "Office Supplies QA" created (₦25,000, QA Test Vendor Alpha, Cash) | ✅ PASS |
| EXP-003 | Create expense WITHOUT "Paid Through" (PB-027 retest) | Error: "Payment account is required" — even when Amount to Pay is 0 | ❌ FAIL |
| EXP-004 | Create expense with NEGATIVE amount (-50,000) | System correctly blocks: "Expense amount must be greater than 0" | ✅ PASS |
| EXP-005 | Vendor-expense linkage | Expense correctly references "QA Test Vendor Alpha" — vendor's Total Spending updated to ₦55,000 | ✅ PASS |
| EXP-006 | Expense form structure | Fields: Name, Type, Account, Vendor, Date, Amount, Amount Is (Tax Exclusive/Inclusive), Amount to Pay, Paid Through | ✅ PASS |

### Bug Status Updates
- **PB-026 (Negative Amount):** ✅ **FIXED** — Negative values are now properly rejected
- **PB-027 (Paid Through Required):** ❌ **STILL OPEN** — "Paid Through" is mandatory even when "Amount to Pay Now" is 0

---

## 3. Recurring Expenses

### Test Results

| Test Case | Action | Result | Status |
|:---|:---|:---|:---:|
| REC-001 | View recurring expense list | Displays correctly with columns (Purchase ID, Vendor, Date, Next Date, Frequency, Price, Status) | ✅ PASS |
| REC-002 | Create monthly recurring (6 occurrences, May 1 start) | Created successfully, but **End Date calculated incorrectly** | ⚠️ PARTIAL |
| REC-003 | End Date calculation (Monthly, 6 occ, May 1) | Expected: Oct 1, 2026. Actual: **Nov 1, 2026** (+1 month) | ❌ FAIL |
| REC-004 | Recurring form fields | Expense Name, Vendor, Item, Account, Frequency, Occurrences, Start Date, End Date (auto), Amount, Payment Account | ✅ PASS |

### New Bug Found
- **PB-029: Recurring Expense End Date Calculation — Off by +1 period** — Monthly recurring with 6 occurrences starting May 1 calculates End Date as Nov 1 instead of Oct 1. The system adds N periods instead of (N-1). This is similar to the previously voided PB-024 (daily off by +1 day) but for monthly frequency — **the root cause was never fixed, only voided.**

---

## 4. Data Integrity & Relationships

| Check | Result | Status |
|:---|:---|:---:|
| Expense → Vendor linkage | Expenses correctly reference their assigned vendor | ✅ PASS |
| Vendor Total Spending | Updates when expenses are added to a vendor | ✅ PASS |
| Vendor duplicate email prevention | Working — backend validation active | ✅ PASS |
| Orphan expense records | No orphans detected | ✅ PASS |
| Recurring → Expense generation | Recurring expense creates linked records at correct intervals | ⚠️ Not fully verified |

---

## 5. Reports Validation

| Check | Result | Status |
|:---|:---|:---:|
| Dashboard Total Expenses KPI | Shows ₦15,000 (before QA test expenses) | ✅ PASS |
| Reports > Financial Reports > P&L | Total Expenses: ₦5,000 | ⚠️ Discrepancy with Dashboard |
| Purchase Reports tab available | Yes — visible in Reports page | ✅ PASS |
| Dashboard vs P&L expense mismatch | Dashboard: ₦15,000 vs P&L: ₦5,000 — **₦10,000 gap** | ❌ FAIL |

### New Issue Found
- **Dashboard Expenses (₦15,000) does not match P&L Expenses (₦5,000)** — This suggests either the Dashboard is including non-P&L items or the P&L is excluding certain expense categories. This is a **reconciliation failure** that needs backend investigation.

---

## 6. Edge Case Testing

| Test | Result | Status |
|:---|:---|:---:|
| Negative expense amount | Blocked ✅ | ✅ PASS |
| Zero amount expense | Not tested (requires further testing) | ⬜ TBD |
| Very large amount (₦999,999,999) | Not tested | ⬜ TBD |
| Deleting vendor with linked expenses | Cannot delete vendors (no delete option) | ⬜ N/A |
| Missing optional fields | Expense creates successfully with only required fields + Paid Through | ✅ PASS |

---

## 7. All Bugs Summary

### Previously Open Bugs — Status Update

| Ticket | Description | Previous Status | Current Status | Notes |
|:---|:---|:---:|:---:|:---|
| PB-023 | Vendor duplicate email accepted | Open | **✅ FIXED** | System now rejects duplicates |
| PB-026 | Expense negative amount accepted | Open | **✅ FIXED** | System now blocks negative values |
| PB-027 | Paid Through required when Amount=0 | Open | **❌ Still Open** | No change |

### New Bugs Found This Session

| Ticket | Module | Description | Severity | Team |
|:---|:---|:---|:---:|:---|
| PB-028 | Purchase > Vendor | **No Delete option for vendors** — only View, Edit, Mark Inactive available in action menu. Cannot permanently remove vendor records. | Medium | Backend |
| PB-029 | Purchase > Recurring | **End Date calculation off by +1 period** — Monthly recurring with 6 occurrences from May 1 shows End Date Nov 1 (should be Oct 1). Same root cause as voided PB-024 but for monthly frequency. | Medium | Backend |

---

## 8. Module Verdicts

| Module | Status | Verdict |
|:---|:---:|:---|
| **Vendor** | ⚠️ PARTIAL PASS | CRUD works except Delete. Duplicate validation fixed. |
| **Expenses** | ⚠️ PARTIAL PASS | Create/Read works. PB-027 still blocks some workflows. Negative values now blocked. |
| **Recurring Expenses** | ⚠️ PARTIAL PASS | Creation works but end date calculation is incorrect. |
| **Reports/Reconciliation** | ❌ FAIL | Dashboard vs P&L expense mismatch (₦15K vs ₦5K). |

---

## 9. Final Verdict

### Is the Purchase module functionally reliable for production?

## ⚠️ CONDITIONAL — NOT YET

**Why not fully ready:**
1. **PB-027** blocks expense creation for users who don't want to pay immediately
2. **PB-029** means recurring expense schedules will be off by 1 period
3. **Dashboard vs P&L mismatch** erodes trust in financial accuracy
4. **No vendor delete** creates data management issues

**What's working well:**
- ✅ Vendor CRUD (Create, Read, Update) with proper duplicate validation
- ✅ Expense creation with vendor linkage
- ✅ Negative value protection (fixed!)
- ✅ Professional form design with proper field organization

**Recommendation:** Fix PB-027 and PB-029 before launch. The Dashboard/P&L reconciliation issue needs backend investigation to determine which number is correct.

---

## Test Data Created During This Session

| Module | Data | Reference |
|:---|:---|:---|
| Vendor | QA Test Vendor Alpha | qa.alpha@test.com, 09099998888 |
| Vendor | QA Test Vendor Beta | qa.beta@test.com, 08022223333 |
| Expense | Office Supplies QA | ₦25,000, QA Test Vendor Alpha |
| Recurring | QA Recurring Office Supplies | Monthly, 6 occ, ₦5,000 |

---

*Report generated by Azeez Test Lab — May 1, 2026*
*Purchase Module Functional Test | Session 2*
