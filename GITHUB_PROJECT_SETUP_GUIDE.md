# GitHub Project Board — Setup Guide for PrimBooks Bug Tracking

## Step 1: Create the Project

1. Go to your company GitHub repo
2. Click the **"Projects"** tab at the top
3. Click **"New Project"**
4. Select **"Table"** view (looks like a spreadsheet)
5. Name it: **"PrimBooks QA Bug Tracker"**
6. Click **"Create project"**

---

## Step 2: Add Custom Columns (Fields)

By default you'll see "Title" and "Status". You need to customize the columns:

### Change the Status Field
1. Click the **"Status"** column header → **"Edit field"**
2. Delete the default options and add these:
   - `🔴 Open` (color: Red)
   - `🟡 Fixed` (color: Yellow)
   - `🟢 Closed` (color: Green)
   - `⚫ Void` (color: Gray)
3. Save

### Add New Columns
Click the **"+"** button on the right side of the table header to add each column:

| Column Name | Field Type | Options |
|:---|:---|:---|
| **Ticket #** | Text | — |
| **Module** | Single Select | Dashboard, Finance, Reports, Payroll, Timesheet, Assets, Production, Purchase, Inventory, CRM, Global |
| **Severity** | Single Select | 🔴 Critical, 🟠 High, 🟡 Medium, 🟢 Low |
| **Team** | Single Select | Backend, Frontend |
| **Notes** | Text | — |

> **Tip:** You can drag column headers to reorder them. Recommended order:
> Ticket # → Title → Module → Severity → Status → Team → Notes

---

## Step 3: Add the 26 Bugs

At the bottom of the table, click **"+ Add item"**, type the title, press Enter. Then click each cell to set the fields.

### Quick-Paste List (Title → then set fields)

Copy each title below, paste into "+ Add item", press Enter, then set the row fields:

```
PB-001 | Revenue KPI shows ₦0.00 despite ₦550K in invoices
PB-002 | Expenses KPI shows ₦0.00 despite payroll data
PB-003 | Orders KPI shows 1 when 2 orders exist
PB-004 | Invoices KPI shows 0 when 2 invoices exist
PB-005 | Invoice Donut chart shows 0 Issued when 2 exist
PB-006 | Revenue Analysis chart completely empty
PB-007 | Banks widget shows "No accounts" despite Main Bank in CoA
PB-008 | Invoices don't auto-create journal entries
PB-009 | Banking Overview shows all zeros
PB-010 | Taxation page empty — no default tax templates
PB-011 | P&L shows ₦0.00 for ALL categories
PB-012 | Balance Sheet UNBALANCED — ₦10M Assets vs ₦0 Equity
PB-013 | Trial Balance UNBALANCED — ₦10M Debit vs ₦0 Credit
PB-014 | Cash Flow shows ₦0.00 across all categories
PB-015 | Can't add employees to payroll run — no button exists
PB-016 | Payroll Dashboard shows 0 employees despite 2 existing
PB-017 | Department success modal shows "undefined"
PB-018 | Employee success modal shows "undefined undefined"
PB-019 | Add Attendance button completely unresponsive
PB-020 | Asset Classification dropdown not interactive
PB-021 | Production Select Material dropdown not interactive
PB-022 | Vendor creation fails — hidden required fields on Other Info tab
PB-023 | Edit Vendor resets Vendor Type from Company to Individual
PB-024 | Inventory form missing SKU/Code and Category fields
PB-025 | Next.js hydration error persists across pages
PB-026 | No Payroll/HR reports in Reports module
```

### Field Values for Each Bug

After pasting each title, click the cells to set:

| Ticket # | Module | Severity | Status | Team |
|:---|:---|:---|:---|:---|
| PB-001 | Dashboard | 🔴 Critical | 🔴 Open | Backend |
| PB-002 | Dashboard | 🔴 Critical | 🔴 Open | Backend |
| PB-003 | Dashboard | 🟠 High | 🔴 Open | Backend |
| PB-004 | Dashboard | 🟠 High | 🔴 Open | Backend |
| PB-005 | Dashboard | 🟠 High | 🔴 Open | Backend |
| PB-006 | Dashboard | 🟠 High | 🔴 Open | Backend |
| PB-007 | Dashboard | 🟡 Medium | 🔴 Open | Backend |
| PB-008 | Finance | 🔴 Critical | 🔴 Open | Backend |
| PB-009 | Finance | 🟠 High | 🔴 Open | Backend |
| PB-010 | Finance | 🟡 Medium | 🔴 Open | Backend |
| PB-011 | Reports | 🔴 Critical | 🔴 Open | Backend |
| PB-012 | Reports | 🔴 Critical | 🔴 Open | Backend |
| PB-013 | Reports | 🔴 Critical | 🔴 Open | Backend |
| PB-014 | Reports | 🟠 High | 🔴 Open | Backend |
| PB-015 | Payroll | 🔴 Critical | 🔴 Open | Frontend |
| PB-016 | Payroll | 🟠 High | 🔴 Open | Backend |
| PB-017 | Payroll | 🟡 Medium | 🔴 Open | Frontend |
| PB-018 | Payroll | 🟡 Medium | 🔴 Open | Frontend |
| PB-019 | Timesheet | 🟠 High | 🔴 Open | Frontend |
| PB-020 | Assets | 🔴 Critical | 🔴 Open | Frontend |
| PB-021 | Production | 🔴 Critical | 🔴 Open | Frontend |
| PB-022 | Purchase | 🟠 High | 🔴 Open | Frontend |
| PB-023 | Purchase | 🟡 Medium | 🔴 Open | Frontend |
| PB-024 | Inventory | 🟡 Medium | 🔴 Open | Frontend |
| PB-025 | Global | 🟡 Medium | 🔴 Open | Frontend |
| PB-026 | Reports | 🟡 Medium | 🔴 Open | Backend |

---

## Step 4: Using the Board

### Changing Status (The Part You Want!)
1. Click on any row's **Status** cell
2. A dropdown appears: 🔴 Open | 🟡 Fixed | 🟢 Closed | ⚫ Void
3. **Click your choice — done.** Color changes instantly.

### Filtering (For Meetings)
- Click **"Filter"** at the top
- Filter by: `Status = 🔴 Open` to see all open bugs
- Filter by: `Team = Backend` to see backend-only bugs
- Filter by: `Severity = 🔴 Critical` to see critical-only

### Grouping (For Meeting Overview)
- Click **"Group by"** → select **"Status"**
- Bugs will group into Open / Fixed / Closed sections with counts
- This is your **meeting audit view** — shows counts per status at a glance

### Saving Views
- Click **"Save view"** to save a filtered/grouped layout
- Create views like: "All Bugs", "Open Only", "By Team", "Meeting Audit"

---

## How Your Workflow Should Go

```
Test Day:
  You run tests → Find bugs → Add new rows to the Project Board
  
Between Meetings:
  Devs fix bugs → You re-test → Click Status: 🔴 Open → 🟡 Fixed
  If verified working → Click Status: 🟡 Fixed → 🟢 Closed
  
Meeting Day:
  Open the Project Board → Group by Status
  Show: "We had 26 bugs. 10 Fixed, 5 Closed, 11 still Open"
  Filter by 🔴 Open → "These are the bugs still blocking us"
```

---

*Guide by Azeez Test Lab — April 9, 2026*
