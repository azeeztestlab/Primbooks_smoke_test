# PrimBooks QA Report — CRM & Record Module Audit

**Prepared by:** Azeez Test Lab  
**Date:** April 21, 2026  
**Environment:** localhost:3000  
**Account:** Gundro Nodes Inc (Admin)  
**Live Tracker:** [azeeztestlab.github.io/Primbooks_smoke_test/bug_tracker.html](https://azeeztestlab.github.io/Primbooks_smoke_test/bug_tracker.html)

---

## Executive Summary

A comprehensive functional regression test was conducted on the **CRM** and **Record** modules of PrimBooks. The audit covered **45 test cases** across **7 sub-modules**, testing from the perspective of a standard user, an accountant, and an advanced power-user.

**22 bugs** have been identified to date — of which **7 are now closed (verified fixed)**, **5 are in fixed state (awaiting re-test)**, and **10 remain open**. The platform has shown significant improvement since the initial audit, with a **55% resolution rate** on reported issues.

---

## Platform Health Overview

| Metric | Value |
|--------|-------|
| Total Bugs Reported | 22 |
| Open | 10 |
| Fixed (Awaiting Verification) | 5 |
| Closed (Verified Fixed) | 7 |
| Resolution Rate | **55%** |
| Test Cases Executed | 45 |
| Pass Rate | **62%** |

---

## Bug Status Breakdown

### Closed (Verified Fixed) — 7

| Ticket | Module | Feature | Severity |
|--------|--------|---------|----------|
| PB-001 | CRM | Customer List — Refresh Required | Low |
| PB-003 | CRM | Order/Invoice — Payment Date Fixed | Medium |
| PB-006 | CRM | Order — Discount Display Ambiguity | Low |
| PB-011 | CRM | Quotation — Delete Modal Blocks UI | Medium |
| PB-012 | CRM | Quotation — Notes Not Reflecting | Medium |
| PB-017 | CRM | Invoice — Column Alignment | Low |
| PB-018 | CRM | Invoice — Watermark Shows "SENT" | Medium |

### Fixed (Pending Re-verification) — 5

| Ticket | Module | Feature | Severity |
|--------|--------|---------|----------|
| PB-002 | CRM | Credit Note — Issue Date Stuck | Medium |
| PB-007 | CRM | Invoice — Leading Zero in Discount | Medium |
| PB-009 | CRM | Invoice — Validation Error on Create | Medium |
| PB-010 | CRM | Quotation — Date Picker Fixed | Low |
| PB-022 | Dashboard | Balance Sheet — Ghost ₦100M Amount | High |

### Open (Unresolved) — 10

| Ticket | Module | Feature | Severity | Team |
|--------|--------|---------|----------|------|
| **PB-015** | **CRM** | **Invoice — Balance Due Shows ₦0.00** | **High** | Backend |
| **PB-019** | **CRM** | **Order — Negative Discount Increases Total** | **High** | Backend |
| PB-004 | Record | Opening Balance Accepts Negative Values | Low | Backend |
| PB-005 | Record | Selling Price Accepts Negative Values | Low | Backend |
| PB-008 | CRM | Order — Leading Zero in Quantity | Low | Frontend |
| PB-013 | CRM | Quotation — Invalid Date on View | Medium | Frontend |
| PB-014 | CRM | Quotation — Column Misalignment | Low | Frontend |
| PB-016 | CRM | Invoice — Discount Shows as ₦ not % | Low | Frontend |
| PB-020 | CRM | Order — Negative Qty Concatenation | Low | Frontend |
| PB-021 | Record | Service Records Show Goods-Only Units | Low | Frontend |

---

## Priority Issues (Action Required)

### 🔴 HIGH — PB-015: Invoice Balance Due Calculation Broken
**Impact:** Financial reporting integrity  
An invoice with ₦0.00 Amount Paid still displays Balance Due as ₦0.00 instead of the full invoice total. This renders all unpaid invoices as appearing paid, which could lead to missed collections and inaccurate revenue tracking.

### 🔴 HIGH — PB-019: Negative Discount Inflates Order Totals
**Impact:** Revenue leakage / overcharging risk  
Entering a negative discount (e.g. -10%) causes the Grand Total to **increase** instead of decrease. A ₦7,500 order becomes ₦8,250 — effectively applying a hidden surcharge. No input validation prevents this.

---

## Test Cases Summary

### CRM — Order Module (12 Tests)

| ID | Scenario | Status |
|----|----------|--------|
| TC_PB_ORD_001 | Create order with valid data | ✅ Pass |
| TC_PB_ORD_002 | Discount displays as percentage | ✅ Pass |
| TC_PB_ORD_003 | Negative discount value (-10) | ❌ Fail → PB-019 |
| TC_PB_ORD_004 | Discount value > 100% | ❌ Fail → PB-019 |
| TC_PB_ORD_005 | Zero quantity input | ⚠️ Open |
| TC_PB_ORD_006 | Negative quantity input | ❌ Fail → PB-020 |
| TC_PB_ORD_007 | Leading zero in Quantity field | ❌ Fail → PB-008 |
| TC_PB_ORD_008 | Add multiple items to order | ✅ Pass |
| TC_PB_ORD_009 | Delete item from order | ✅ Pass |
| TC_PB_ORD_010 | Payment Status dropdown | ✅ Pass |
| TC_PB_ORD_011 | Shipping cost calculation | ✅ Pass |
| TC_PB_ORD_012 | Notes field | ✅ Pass |

### CRM — Invoice Module (9 Tests)

| ID | Scenario | Status |
|----|----------|--------|
| TC_PB_INV_001 | Invoice list page loads | ✅ Pass |
| TC_PB_INV_002 | Create Invoice button | ✅ Pass |
| TC_PB_INV_003 | Invoice creation with Payment Status + Revenue Account | ✅ Pass |
| TC_PB_INV_004 | Balance Due calculation | ❌ Fail → PB-015 |
| TC_PB_INV_005 | Discount display on invoice view | ❌ Fail → PB-016 |
| TC_PB_INV_006 | Column alignment on invoice view | ✅ Pass |
| TC_PB_INV_007 | Invoice watermark status | ✅ Pass |
| TC_PB_INV_008 | Record Payment date picker | ✅ Pass |
| TC_PB_INV_009 | Search invoice functionality | ✅ Pass |

### CRM — Customer Module (7 Tests)

| ID | Scenario | Status |
|----|----------|--------|
| TC_PB_CUST_001 | Add individual customer | ✅ Pass |
| TC_PB_CUST_002 | Customer appears without refresh | ✅ Pass |
| TC_PB_CUST_003 | Add company-type customer | ⚠️ Open |
| TC_PB_CUST_004 | Duplicate email validation | ⚠️ Open |
| TC_PB_CUST_005 | Empty required fields | ✅ Pass |
| TC_PB_CUST_006 | Customer list pagination | ✅ Pass |
| TC_PB_CUST_007 | Phone number format | ⚠️ Open |

### CRM — Quotation Module (7 Tests)

| ID | Scenario | Status |
|----|----------|--------|
| TC_PB_QUO_001 | Create quotation | ✅ Pass |
| TC_PB_QUO_002 | Date picker on quotation | ✅ Pass |
| TC_PB_QUO_003 | View quotation date display | ❌ Fail → PB-013 |
| TC_PB_QUO_004 | Column alignment on view | ❌ Fail → PB-014 |
| TC_PB_QUO_005 | Subject/Notes on view | ✅ Pass |
| TC_PB_QUO_006 | Delete quotation flow | ✅ Pass |
| TC_PB_QUO_007 | Quotation to Invoice conversion | ⚠️ Open |

### CRM — Credit Notes Module (3 Tests)

| ID | Scenario | Status |
|----|----------|--------|
| TC_PB_CN_001 | Credit Notes page loads | ✅ Pass |
| TC_PB_CN_002 | Issue Date on Credit Note | ✅ Pass |
| TC_PB_CN_003 | Add button responsiveness | ⚠️ Open |

### Record — Goods (5 Tests)

| ID | Scenario | Status |
|----|----------|--------|
| TC_PB_REC_001 | Create goods record | ✅ Pass |
| TC_PB_REC_002 | Negative opening balance | ❌ Fail → PB-004 |
| TC_PB_REC_003 | Negative selling price | ❌ Fail → PB-005 |
| TC_PB_REC_004 | Unit selection for goods | ✅ Pass |
| TC_PB_REC_005 | Record list view | ✅ Pass |

### Record — Services (2 Tests)

| ID | Scenario | Status |
|----|----------|--------|
| TC_PB_REC_006 | Create service record | ✅ Pass |
| TC_PB_REC_007 | Unit options for services | ⚠️ Open → PB-021 |

---

## Modules Tested vs. Remaining

| Module | Status |
|--------|--------|
| ✅ CRM — Orders | Completed |
| ✅ CRM — Invoice | Completed |
| ✅ CRM — Customer | Completed |
| ✅ CRM — Quotation | Completed |
| ✅ CRM — Credit Notes | Completed |
| ✅ Record — Goods | Completed |
| ✅ Record — Services | Completed |
| 🔲 Finance | Pending |
| 🔲 Purchase | Pending |
| 🔲 Dashboard | Pending |
| 🔒 Production | Locked — Not accessible |
| 🔒 Inventory | Locked — Not accessible |
| 🔒 Bank Reconciliation | Locked — Not accessible |

---

## Team Breakdown

### Backend — 5 Open Issues
- PB-004: Negative opening balance accepted
- PB-005: Negative selling price accepted
- PB-015: Balance Due always ₦0.00 **(HIGH)**
- PB-019: Negative discount inflates total **(HIGH)**
- PB-022: Balance Sheet ghost amount (Fixed)

### Frontend — 5 Open Issues
- PB-008: Leading zero in quantity field
- PB-013: Invalid date on quotation view
- PB-014: Quotation column misalignment
- PB-016: Discount shows ₦ instead of %
- PB-020: Negative quantity concatenation
- PB-021: Service units incorrect

---

## Recommendations

1. **Immediate — Backend Validation:**  
   PB-015 and PB-019 are high-severity accounting logic errors that directly impact financial accuracy. These should be prioritized before any user-facing release.

2. **Input Validation Pass:**  
   PB-004, PB-005, PB-008, and PB-020 all relate to missing input validation on numeric fields. A single backend/frontend validation sweep across all numeric inputs would resolve all four simultaneously.

3. **Date Handling:**  
   PB-013 (invalid date) suggests a date serialization issue in the quotation view. Likely the same root cause as the previously-fixed date bugs (PB-002, PB-003, PB-010).

4. **Next Module:**  
   CRM and Record modules are now fully audited. Recommend proceeding to **Finance** and **Purchase** modules next.

---

## Conclusion

The CRM and Record modules have undergone thorough testing with 45 test cases executed. The development team has resolved **12 of 22 issues (55%)** since the initial audit began. The two remaining high-severity bugs (PB-015, PB-019) pose direct risk to accounting accuracy and should be addressed before the next release cycle.

**Next Steps:**
- Dev team addresses PB-015 and PB-019 (High priority)
- QA moves to Finance and Purchase modules
- Re-test fixed bugs (PB-002, PB-007, PB-009, PB-010) for closure

---

*Report generated by Azeez Test Lab — Live tracker: [Bug Tracker Dashboard](https://azeeztestlab.github.io/Primbooks_smoke_test/bug_tracker.html)*
