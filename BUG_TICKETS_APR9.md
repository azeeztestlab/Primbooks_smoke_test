# PrimBooks — Bug Tickets Registry

**Last Updated:** April 13, 2026
**QA Lead:** Azeez Test Lab
**Status Key:** 🔴 Open | 🟡 Fixed | 🟢 Closed | ⚫ Void

---

## Active Bug Tickets

> **Registry Reset — April 10, 2026**
> Previous tickets (PB-001 through PB-026) have been voided. Fresh module-by-module verification began April 13, 2026.

| Ticket # | Module | Feature | Bug Description | Steps to Reproduce | Expected Behavior | Actual Behavior | Severity | Status | Assigned To |
|:---|:---|:---|:---|:---|:---|:---|:---:|:---:|:---:|
| PB-027 | Dashboard | KPI Cards | **Dashboard Revenue/Expenses show ₦0.00 despite active invoices and orders** | 1. Create invoices and orders in CRM 2. Navigate to Dashboard | KPI cards should reflect real financial data (Total Revenue, Total Expenses) | Total Revenue: ₦0.00, Total Expenses: ₦0.00 — KPIs are not wired to actual transaction data | 🔴 Critical | 🔴 Open | Dev Team |
| PB-028 | Dashboard | KPI — Invoices Count | **Invoice count shows 1 but multiple invoices exist** | 1. Create multiple invoices in CRM > Invoice 2. Check Dashboard Invoices card | Should display accurate count of all invoices | Shows "1" despite multiple invoices created (INV/000001, INV/000002, INV/000003 exist) | 🟠 High | 🔴 Open | Dev Team |
| PB-029 | CRM | Quotation — Expiry Date | **Quotation expiry date shows "_ _ _" (blank) after creation** | 1. Go to CRM > Quotation 2. Create a new quote with items 3. View the quote in the list | Expiry date should auto-populate or be settable during creation | Expiry Date column shows "_ _ _" — no date set, no field visible in creation form | 🟡 Medium | 🔴 Open | Dev Team |
| PB-030 | CRM | Credit Notes — No Edit/Delete | **Credit Notes have no Edit or Delete capability** | 1. Go to CRM > Credit Notes 2. Click 3-dot action menu on any credit note 3. Look for Edit/Delete options | Should be able to edit or delete credit notes | Action menu only shows "View" — no Edit or Delete options available. Records are permanently locked after creation. | 🟠 High | 🔴 Open | Dev Team |
| PB-031 | CRM | Credit Notes — No Create Button Action | **"+ Add Credit Note" button does not open a creation form** | 1. Go to CRM > Credit Notes 2. Click "+ Add Credit Note" | Should open a creation form for new credit note | Button does not trigger a creation form; credit notes can only be created from within an invoice context | 🟡 Medium | 🔴 Open | Dev Team |
| PB-032 | Record | Opening Balance | **All records show ₦0.00 Opening Balance regardless of value set** | 1. Go to Record module 2. View any record's Opening Balance column | Should reflect the opening balance entered during creation | All records show ₦0.00 — opening balance field may not save or display correctly | 🟡 Medium | 🔴 Open | Dev Team |
| PB-033 | Global | Persistent Error Badge | **"1 Issue" red error badge persists in bottom-left corner** | 1. Log in to PrimBooks 2. Observe bottom-left corner of the screen | No error badges should appear during normal operation | A persistent red "1 Issue" badge with "N" icon appears on every page — unclear what error it refers to | 🟡 Medium | 🔴 Open | Dev Team |

---

## Bug Count Summary

| Severity | Count |
|:---|:---:|
| 🔴 **Critical** | 1 |
| 🟠 **High** | 2 |
| 🟡 **Medium** | 4 |
| 🟢 **Low** | 0 |
| **TOTAL** | **7** |

---

## ✅ Passed Test Cases (April 13, 2026)

> **Use these case IDs for your reports. All verified with screenshots.**

| Case ID | Module | Feature | Test Performed | Result | Reference Data |
|:---|:---|:---|:---|:---:|:---|
| TC-001 | Login | Authentication | Login with gundro.nodes@gmail.com / Aliciababs | ✅ PASS | Lands on Dashboard, user: GOATED ENTERPRISE Admin |
| TC-002 | Dashboard | Page Load | Dashboard loads with KPI cards and Cash Flow chart | ✅ PASS | 4 KPI cards visible, Cash Flow FY2026 renders |
| TC-003 | CRM > Customer | **CREATE** | Created customer "John Smith" (Individual, john.doe@example.com, 08012345678) | ✅ PASS | Success modal: "Customer created successfully!" |
| TC-004 | CRM > Customer | **READ** | Customer list displays all customers with Name, Type, Email, Phone, Status, Amount Spent, Date | ✅ PASS | 3 customers shown: John Smith, Test User, Amina Bello |
| TC-005 | CRM > Customer | **UPDATE** | Edited John Smith — updated fields and saved | ✅ PASS | Success modal: "Customer updated successfully!" |
| TC-006 | CRM > Customer | **DELETE** | Deleted John Smith via 3-dot menu > Delete | ✅ PASS | Confirmation dialog shown, record removed from list |
| TC-007 | CRM > Order | **READ** | Order list page loads with KPI summary cards | ✅ PASS | Total Orders: 1, Pending: 1, Completed: 0, Cancelled: 0 |
| TC-008 | CRM > Order | **CREATE — Add Item** | Tested Add Item button on Create Order form (Type: Goods) | ✅ PASS | "Add Item" button exists below the items table; opens "Select from record" modal |
| TC-009 | CRM > Invoice | **CREATE** | Created invoice with 1 item (Website Design Package, ₦500,000) | ✅ PASS | Confirmation: "Create Invoice? With 1 item(s)?" — Confirmed |
| TC-010 | CRM > Invoice | **READ** | Invoice list shows all invoices with columns | ✅ PASS | Invoices visible with Invoice Number, Customer, Amount, Status |
| TC-011 | CRM > Quotation | **READ** | Quotation list page loads correctly | ✅ PASS | Empty state: "No quotations found..." — correct behavior |
| TC-012 | CRM > Quotation | **CREATE** | Created quote QUO/2026/0002 for Test User, SEO Optimization (₦25,000) | ✅ PASS | Confirmation: "Create Quotation? With 1 item(s)?" — Success, appears in list |
| TC-013 | CRM > Quotation | **Add Item** | Quotation "Add Item" button opens "Select from record" modal | ✅ PASS | 3 records available: SEO Optimization, Social Media Mgmt, Website Design Package |
| TC-014 | CRM > Credit Notes | **READ** | Credit Notes list displays 2 existing notes | ✅ PASS | CN/0001 (Test User, INV/000002, ₦25,000), CN/0002 (Egunjobi Oladele, INV/000001, ₦500,000) |
| TC-015 | CRM > Credit Notes | **VIEW Detail** | Clicked CN/0001 — detail panel opens with full info | ✅ PASS | Shows Subject, Customer Details, Invoice Reference, Dates, Items breakdown |
| TC-016 | Record | **READ** | Record list displays all inventory/service records | ✅ PASS | 3 records: SEO Optimization (₦25K, 100pcs), Social Media Mgmt (₦50K, 50pcs), Website Design (₦250K, 10pcs) |
| TC-017 | Record | **CREATE** | Created "Test Record QA" (Goods, ₦15,000, 20 Piece) | ✅ PASS | Record appears in list — 4 total records, Apr 13 2026 date |
| TC-018 | Record | **UPDATE** | Edited "Test Record QA" — renamed to "Test Record QA edited" | ✅ PASS | Name updated in list view successfully |
| TC-019 | Record | **DELETE** | Deleted "Test Record QA edited" via 3-dot menu | ✅ PASS | Confirmation dialog shown, record removed, back to 3 records |
| TC-020 | Record | **Action Menu** | 3-dot menu shows View Item, Edit Item, Delete Item options | ✅ PASS | All 3 actions available and functional |

---

## Test Data Created During This Session

| Module | Data | Reference IDs |
|:---|:---|:---|
| CRM > Customer | John Smith (created then deleted during test) | Individual, john.doe@example.com |
| CRM > Quotation | QUO/2026/0002 | Test User, SEO Optimization, ₦25,000, Pending |
| CRM > Invoice | New invoice created | Website Design Package, ₦500,000 |
| Record | Test Record QA (created then deleted during test) | Goods, ₦15,000, 20 Piece |

---

*Registry maintained by Azeez Test Lab*
*Session: April 13, 2026 — CRM & Record Module Deep CRUD Testing*
