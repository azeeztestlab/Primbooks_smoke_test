# PrimBooks — Bug Tickets Registry

**Last Updated:** April 9, 2026
**QA Lead:** Azeez Test Lab
**Status Key:** 🔴 Open | 🟡 Fixed | 🟢 Closed

---

## Active Bug Tickets

| Ticket # | Module | Feature | Bug Description | Steps to Reproduce | Expected Behavior | Actual Behavior | Severity | Status | Assigned To |
|:---|:---|:---|:---|:---|:---|:---|:---:|:---:|:---:|
| PB-001 | Dashboard | Revenue KPI | Total Revenue shows ₦0.00 despite ₦550,000 in invoices | 1. Create invoices in CRM 2. Go to Dashboard 3. Check Total Revenue card | Revenue KPI should show sum of all invoices (₦550,000) | Shows ₦0.00 | 🔴 Critical | 🔴 Open | Backend |
| PB-002 | Dashboard | Expenses KPI | Total Expenses shows ₦0.00 despite payroll data existing | 1. Create employees with salaries 2. Go to Dashboard 3. Check Total Expenses card | Should reflect payroll costs | Shows ₦0.00 | 🔴 Critical | 🔴 Open | Backend |
| PB-003 | Dashboard | Orders Count | Orders KPI shows 1 when 2 orders exist | 1. Create 2 orders in CRM 2. Go to Dashboard 3. Check Orders card | Should show "2" | Shows "1" | 🟠 High | 🔴 Open | Backend |
| PB-004 | Dashboard | Invoices Count | Invoices KPI shows 0 when 2 invoices exist | 1. Create 2 invoices in CRM 2. Go to Dashboard 3. Check Invoices card | Should show "2" | Shows "0" | 🟠 High | 🔴 Open | Backend |
| PB-005 | Dashboard | Invoice Donut | Invoice Donut chart shows "0 Issued" when 2 exist | 1. Create invoices 2. Check Dashboard donut chart | Should show 2 Issued | Shows "0 Issued Invoice(s)" | 🟠 High | 🔴 Open | Backend |
| PB-006 | Dashboard | Revenue Chart | Revenue Analysis chart is completely empty/flat | 1. Create invoices 2. Check Dashboard Revenue Analysis | Should show income data points | Flat line at zero | 🟠 High | 🔴 Open | Backend |
| PB-007 | Dashboard | Banks Widget | "Banks and Credit Cards" shows "No accounts configured" despite Main Bank in CoA | 1. Check Finance > CoA (Main Bank exists) 2. Check Dashboard Banks widget | Should show Main Bank | Shows "No bank accounts or credit cards configured" | 🟡 Medium | 🔴 Open | Backend |
| PB-008 | Finance | Journal Entries | No auto-generated journal entries from invoice creation | 1. Create an invoice in CRM 2. Go to Finance > Journal 3. Check for new entries | Invoice should auto-create a journal entry (Revenue recognition) | "No record found" — journal is empty | 🔴 Critical | 🔴 Open | Backend |
| PB-009 | Finance | Banking Overview | Banking page shows all zeros despite Chart of Accounts having Main Bank | 1. Go to Finance > Banking 2. Check balances | Should show Main Bank balance | Bank ₦0.00, Card ₦0.00, Cash ₦0.00 | 🟠 High | 🔴 Open | Backend |
| PB-010 | Finance | Taxation | Taxation page is completely empty — no default tax templates | 1. Go to Finance > Taxation | Should have at least VAT/WHT templates for Nigeria | "No taxation data found" | 🟡 Medium | 🔴 Open | Backend |
| PB-011 | Reports | P&L Statement | Profit & Loss shows ₦0.00 for ALL categories despite transactions existing | 1. Create invoices (₦550K total) 2. Go to Reports > P&L 3. View "All Time" | Sales Revenue should show ₦550,000. Expenses should reflect payroll | All categories: ₦0.00 | 🔴 Critical | 🔴 Open | Backend |
| PB-012 | Reports | Balance Sheet | Balance Sheet is UNBALANCED — ₦10M Assets vs ₦0 Equity | 1. Go to Reports > Balance Sheet | Assets should equal Liabilities + Equity | Assets: ₦10,000,000. Liabilities: ₦0. Equity: ₦0. System shows warning: "Balance Sheet is NOT Balanced" | 🔴 Critical | 🔴 Open | Backend |
| PB-013 | Reports | Trial Balance | Trial Balance is UNBALANCED — ₦10M Debit vs ₦0 Credit | 1. Go to Reports > Trial Balance | Total Debits should equal Total Credits | Debit: ₦10,000,000. Credit: ₦0 | 🔴 Critical | 🔴 Open | Backend |
| PB-014 | Reports | Cash Flow | Cash Flow Statement shows ₦0.00 across all categories | 1. Go to Reports > Cash Flow | Should reflect cash movements from transactions | Operating: ₦0, Investing: ₦0, Financing: ₦0 | 🟠 High | 🔴 Open | Backend |
| PB-015 | Payroll | Payroll Run | Cannot add employees to payroll — no "Add Employee" button or selector exists | 1. Go to Payroll > Create Payroll 2. Fill payroll name and date 3. Try to add employees | Should have a button/dropdown to select employees for payroll | Shows "No employee added" table with no way to populate. Saving gives error: "Please add at least one employee" | 🔴 Critical | 🔴 Open | Frontend |
| PB-016 | Payroll | Dashboard Count | Payroll Dashboard shows "Total Employees: 0" despite 2 employees existing | 1. Create 2 employees 2. Go to Payroll main page 3. Check Total Employees card | Should show "2" | Shows "0" | 🟠 High | 🔴 Open | Backend |
| PB-017 | Payroll | Success Modal | Department creation success modal shows "Department undefined" | 1. Go to Payroll > Departments 2. Create a new department 3. Observe success message | Should show "Department Engineering has been successfully added" | Shows "Department undefined has been successfully added" | 🟡 Medium | 🔴 Open | Frontend |
| PB-018 | Payroll | Success Modal | Employee creation success modal shows "Employee undefined undefined" | 1. Go to Payroll > Employees 2. Create a new employee 3. Observe success message | Should show "Employee Medusa Ikudaisi has been successfully added" | Shows "Employee undefined undefined has been successfully added" | 🟡 Medium | 🔴 Open | Frontend |
| PB-019 | Timesheet | Add Attendance | "Add Attendance" button is completely unresponsive — no modal, no action | 1. Go to Payroll > Timesheet Mgmt. 2. Click "Add Attendance" button | Should open a form/modal to record attendance | Nothing happens. Button does not respond to clicks | 🟠 High | 🔴 Open | Frontend |
| PB-020 | Assets | Create Asset | "Classification" dropdown in asset creation form is not interactive | 1. Go to Assets > Create Asset 2. Fill name, source, cost 3. Try to select Classification | Should open a dropdown with classification options | Dropdown renders as plain text. Cannot select any value. Blocks "Next" step validation | 🔴 Critical | 🔴 Open | Frontend |
| PB-021 | Production | Create Production | "Select Material" dropdown in Raw Materials table is not interactive | 1. Go to Production > Create 2. Look at Raw Materials section 3. Click "Select Material" | Should open dropdown of inventory items (Laptop, Chair) | Element is not rendered as interactive. Clicking does nothing | 🔴 Critical | 🔴 Open | Frontend |
| PB-022 | Purchase | Vendor Creation | Vendor creation fails with 400 error if "Other Information" tab isn't filled — but fields are hidden | 1. Go to Purchase > Vendor > New Vendor 2. Fill only the visible main info tab 3. Click Save | Should save with defaults or show required fields clearly | Returns 400 Bad Request. User must navigate to hidden "Other Information" tab to fill Payment Terms and Debit/Credit Accounts | 🟠 High | 🔴 Open | Frontend |
| PB-023 | Purchase | Edit Vendor | Edit Vendor form resets "Vendor Type" from "Company" back to "Individual" | 1. Create a vendor as "Company" type 2. Click Edit on that vendor 3. Observe the Vendor Type field | Should retain "Company" as the saved type | Defaults back to "Individual" — user must manually re-select | 🟡 Medium | 🔴 Open | Frontend |
| PB-024 | Inventory | Create Form | Inventory creation form has no SKU/Code or Category input fields | 1. Go to Inventory > Create Inventory 2. Look for SKU or Category fields | Should have fields for SKU/Code and Category | Neither field exists. SKU is blank in list, Category defaults to "Goods" | 🟡 Medium | 🔴 Open | Frontend |
| PB-025 | Global | Hydration Error | Next.js hydration error persists across pages: `<td> cannot be a child of <td>` | 1. Open PrimBooks 2. Check bottom-left "1 Issue" badge 3. Click to see error | No console errors in production | Red "1 Issue" badge. Console shows: "Hydration failed because the server rendered HTML didn't match the client" | 🟡 Medium | 🔴 Open | Frontend |
| PB-026 | Reports | Missing Reports | No Payroll/HR reports section in the Reports module | 1. Go to Reports 2. Look for Payroll or HR tabs | Should have at least basic payroll reports (payslips, salary summaries) | Only financial reports available: P&L, Balance Sheet, Trial Balance, Cash Flow, Equity, General Ledger, Bank Ledger | 🟡 Medium | 🔴 Open | Backend |

---

## Bug Count Summary

| Severity | Count | Breakdown |
|:---|:---:|:---|
| 🔴 **Critical** | 9 | PB-001, 002, 008, 011, 012, 013, 015, 020, 021 |
| 🟠 **High** | 8 | PB-003, 004, 005, 006, 009, 014, 016, 019, 022 |
| 🟡 **Medium** | 9 | PB-007, 010, 017, 018, 023, 024, 025, 026 |
| 🟢 **Low** | 0 | — |
| **TOTAL** | **26** | **26 Open, 0 Fixed, 0 Closed** |

---

## Assignment Breakdown

| Team | Ticket Count | Tickets |
|:---|:---:|:---|
| **Backend** | 16 | PB-001 through PB-014, PB-016, PB-026 |
| **Frontend** | 10 | PB-015, PB-017 through PB-025 |

---

*Registry maintained by Azeez Test Lab*
*Last updated: April 9, 2026*
