# 🐛 PrimBooks — Assets & Inventory: Detailed Bug Explanations

> **Date:** May 12, 2026  
> **Tester:** Azeez Test Lab  
> **Environment:** localhost:3000 | Gundro Nodes Inc | Admin  
> **Purpose:** Clear, step-by-step explanations of every bug and enhancement found in the Assets and Inventory modules — no assumptions, full evidence.

---

## 🏢 PART 1: ASSETS MODULE BUGS

These bugs were found during live end-to-end testing of the full asset lifecycle: Create → Lease → Return → Depreciate → Maintain → Dispose.

---

### AST-001: "Asset Acquired" KPI Shows 0 When Total Assets Is 1

**What happened:**  
After creating the "Dell Laptop Latitude 5520" asset under Fixed Assets, the KPI dashboard updated correctly for 3 out of 4 cards — but **"Asset Acquired" stayed at 0**.

**What I saw:**
| KPI Card | Value | Correct? |
|----------|-------|----------|
| Total Assets | 1 | ✅ Yes |
| Value of Assets | ₦450,000.00 | ✅ Yes |
| Asset Acquired | 0 | ❌ No — should be 1 |
| Sold Assets | 0 | ✅ Yes |

**Why it matters:**  
If management looks at the dashboard to track how many assets the company bought this period, it shows 0 even though they just purchased a ₦450k laptop. This is a **data trust problem** — the KPI doesn't match reality.

**How to reproduce:**
1. Go to Assets > List of Assets
2. Click "Add" under Fixed Assets
3. Complete the 4-step wizard (Asset Details → Financial → Manufacturer → Maintenance)
4. Confirm creation
5. Return to the main Asset list page
6. Observe: "Total Assets" says 1 but "Asset Acquired" says 0

**Severity:** Medium | **Team:** Backend

---

### AST-002: Date Off-by-One Error Across All Asset Sub-Modules

**What happened:**  
When selecting dates in any Assets form (Lease, Depreciation, Lease Return), the system consistently saves the date as **one day before** what the user selected.

**Example:**
- User selects **May 12, 2026** as Lease Start Date
- System saves and displays **May 11, 2026**
- Same for End Date: selected **June 12, 2026** → shows **June 11, 2026**

**Why it matters:**  
This is a **timezone/UTC conversion bug**. Lease contracts, depreciation periods, and financial calculations all depend on precise dates. A one-day error can cause:
- Lease period calculations to be off by 1 day
- Depreciation amounts to be miscalculated (pro-rata based on actual days)
- Audit trail dates to not match physical signed contracts

**How to reproduce:**
1. Go to Assets > Lease Assets
2. Click "+ Add Assets" and select any asset
3. In the lease form, select Start Date = May 12, 2026
4. Select End Date = June 12, 2026
5. Save the lease
6. View the lease record in the table
7. Observe: dates show May 11 and June 11 instead

**Severity:** High | **Team:** Backend

---

### AST-003: Asset "Edit" Option Completely Missing from Action Menu

**What happened:**  
When clicking the 3-dot action menu (⋮) on any asset in the Fixed Assets category list, only two options appear:
- ✅ **View Asset**
- ✅ **Delete**
- ❌ **Edit — MISSING entirely**

This is different from the Production module where Edit exists but is greyed out. Here, **Edit doesn't exist at all**.

**Why it matters:**  
If someone enters the wrong acquisition cost, typos the asset name, or needs to update the location after an office move — they **cannot edit the asset**. The only workaround is to delete the entire asset and recreate it from scratch, losing any linked lease/depreciation history.

**How to reproduce:**
1. Go to Assets > List of Assets
2. Click "View" on Fixed Assets category
3. On the Dell Laptop row, click the ⋮ action menu
4. Observe: only "View Asset" and "Delete" are shown — no "Edit"

**Severity:** High | **Team:** Frontend

---

### AST-004: Asset Detail View Page Has No Back Button

**What happened:**  
After clicking "View Asset" from the action menu, the detail page loads showing asset info — but there is **no Back, Cancel, Close, or Return to List button** anywhere on the page.

The user is trapped and must:
- Use the browser's back button, or
- Click "LIST OF ASSETS" in the sidebar manually

**Why it matters:**  
Same issue as PB-034 in Production. This is a consistent UX gap across modules — detail/view pages don't have return navigation.

**Severity:** Low | **Team:** Frontend

---

### AST-005: Asset Detail View Shows Broken Image Placeholder

**What happened:**  
The Asset Detail view shows a **broken image icon** at the top of the page — a grey placeholder where an image should be, even though no image was uploaded during asset creation.

**Why it matters:**  
- The creation form doesn't have an image upload field, so this will always be broken
- Makes the page look unfinished/buggy
- Should either add image upload to the form OR hide the image section when no image exists

**Severity:** Low | **Team:** Frontend

---

### AST-006: "View" Button on Category Cards Gets Stuck in Infinite Loading

**What happened:**  
When clicking the "View" button next to a category (e.g., Fixed Assets) on the main Asset list page, the button frequently enters an **infinite loading spinner** state. It never navigates to the category list. The only fix is a full page refresh.

This was observed 3+ times during testing. Sometimes it works on the first click, sometimes it takes 4-5 attempts.

**Why it matters:**  
Users can't reliably access their assets. If they can't even view the list, they can't manage anything.

**How to reproduce:**
1. Go to Assets > List of Assets
2. Click "View" next to Fixed Assets
3. Observe the button — it may show a spinner indefinitely
4. Refresh the page and try again

**Severity:** High | **Team:** Frontend

---

### AST-007: Leased Assets Hidden from Depreciation and Maintenance Selection

**What happened:**  
When an asset has status "Leased", it **disappears completely** from the asset selection modal in both:
- Depreciation module (cannot calculate depreciation)
- Maintenance module (cannot schedule maintenance)

The asset only reappears after performing a **Lease Return** to change its status back to Active.

**Why it matters:**  
This is a **real-world logic flaw**:
- Companies still **depreciate assets they've leased out** — the asset is still owned, it's just generating lease income
- Companies still need to **maintain leased equipment** — maintenance schedules don't pause during a lease period
- Hiding the asset from these modules breaks standard accounting practices

**How to reproduce:**
1. Create an asset and lease it
2. Go to Assets > Depreciation > "+ Add Asset"
3. In the selection modal, observe: the leased asset doesn't appear
4. Same for Maintenance > "+ Add Assets"
5. Perform a Lease Return for the asset
6. Now go back to Depreciation — the asset reappears

**Severity:** High | **Team:** Backend

---

### AST-008: Lease Return "Condition on Return" Dropdown Nearly Unusable

**What happened:**  
In the Lease Return form, the "Condition on Return" dropdown is positioned near the bottom of the modal. When clicked:
- The dropdown options render **behind or below the visible modal area**
- Scrolling the modal doesn't help — the options remain unclickable
- It required **10+ attempts** and specific scroll positioning to finally select "Good"

**Why it matters:**  
If users can't complete the Lease Return form, they can't free assets for depreciation or other operations. This was the most frustrating UI bug found during testing.

**How to reproduce:**
1. Go to Assets > Lease Return
2. Click "+ Add Lease Return" and select a leased asset
3. Fill in Reason, Return Date, Amount
4. Try to click the "Condition on Return" dropdown
5. Observe: options may not be visible or clickable

**Severity:** Medium | **Team:** Frontend

---

### AST-009: Leading Zero in Currency Input Fields

**What happened:**  
Currency fields like "Amount Paid" and "Lease Amount" have a default value of `0`. When a user types a number (e.g., 50000), the field shows `050000` because the leading zero isn't cleared.

**Why it matters:**  
- Same pattern as PB-007 and PB-008 in CRM module — this is a **platform-wide input bug**
- Can confuse users and may cause incorrect amount parsing

**Severity:** Low | **Team:** Frontend

---

## 📦 PART 2: INVENTORY MODULE BUGS

These bugs were found during inventory item creation and when testing inventory integration with the Production module.

---

### INV-001: Created Items Don't Always Appear in Inventory List

**What happened:**  
During testing, I created **3 inventory items**:
1. **Steel Rods** — ✅ Appeared in the list correctly
2. **Copper Wire** — The creation form was submitted, a **success modal appeared** ("Item created successfully"), but the item **never appeared in the Inventory List**
3. **Aluminum Sheets** — Creation was blocked by dropdown issues before submission

**What I saw after all creation attempts:**
| Inventory List Shows | Expected |
|---------------------|----------|
| Steel Rods (MAT/2026/0001) — 480 pcs @ ₦3,000 | ✅ Correct |
| *Nothing else* | ❌ Should show Copper Wire too |

**Why it matters:**  
The system told the user the item was saved — but it wasn't. This is the worst type of bug: **silent data loss**. The user has no idea their data is gone until they look for it later.

**Possible causes:**
- API returned 200 (success) but the database write failed silently
- The item was saved to a different company/workspace context
- A transaction rollback happened after the success response was sent

**How to reproduce:**
1. Go to Inventory > Item List
2. Click "+ Create" or "Add Item"
3. Fill in item details: Name, Unit, Cost Price, Sales Price, Quantity
4. Select Cost Account and Sales Account from dropdowns
5. Click Save — observe success modal
6. Return to the Inventory List
7. Check if the item appears (it may not)

**Severity:** Critical | **Team:** Backend

---

### INV-002: "Failed to Load Inventory Items" Error on List Page

**What happened:**  
The Inventory List page (`/inventory/list`) intermittently shows a red error banner: **"Failed to load inventory items"**. When this happens:
- The table is completely empty
- No items are visible
- Refreshing sometimes fixes it, sometimes doesn't
- After 2-3 refreshes it usually loads

**Why it matters:**  
If the inventory list can't load, users can't:
- Check stock levels
- Create purchase orders based on current stock
- Add materials to production runs
- Know what they have

**Severity:** High | **Team:** Backend

---

### INV-003: "Created By" Dropdown Fails to Persist Selection

**What happened:**  
When creating an inventory item, the "Created By" dropdown (which lists employees from Payroll) has a specific bug:
1. Click the dropdown → options appear
2. Click an employee name → the dropdown closes
3. The selected name **does not appear** in the field
4. The field still shows "Select Employee" as if nothing was selected
5. Clicking the dropdown again shows no option highlighted

This required **3-4 attempts** before it finally "stuck".

**Why it matters:**  
If the "Created By" field can't be reliably set, and it's required for submission, then the entire item creation form is unreliable. This was observed as a **persistent issue across multiple form submissions**.

**Severity:** Medium | **Team:** Frontend

---

### INV-004: Dropdown Selection Timeouts on Cost/Sales Account Fields

**What happened:**  
The "Cost Account" and "Sales Account" dropdowns in the inventory creation form frequently **time out** when trying to select an option:
1. Click the dropdown → options load (sometimes after 3-5 seconds)
2. Click an option → nothing happens / page becomes unresponsive
3. Must click again after waiting
4. Sometimes the wrong option gets selected due to the lag

**Why it matters:**  
These fields link inventory items to the Chart of Accounts for proper financial tracking. If users can't reliably select accounts, items are either created without proper accounting links or users give up trying.

**Severity:** Medium | **Team:** Frontend

---

## 💡 PART 3: ENHANCEMENT RECOMMENDATIONS (DETAILED)

These are not bugs — these are features that are **missing or incomplete** that a real business would expect.

---

### ENH-001: Add Edit Capability for Assets

**Current state:** No Edit button exists in the asset action menu.  
**What's needed:** Users need to update: Asset Name (typo corrections), Location (office moves), Assigned To (employee changes), Cost (adjustments), Condition (wear and tear updates).  
**Business case:** A company with 500+ assets will constantly need to update records. Forcing delete+recreate loses all linked history (leases, depreciation, maintenance).

---

### ENH-002: Add Asset Transfer Between Locations

**Current state:** An asset's "Location" field is set during creation and can never be changed.  
**What's needed:** A "Transfer Asset" workflow: Select asset → New Location → Transfer Date → Reason → Approved By.  
**Business case:** Companies with multiple offices/branches routinely move equipment. This is standard in any asset management system.

---

### ENH-003: Allow Depreciation of Leased-Out Assets

**Current state:** Leased assets are completely hidden from the Depreciation selection.  
**What's needed:** Leased assets should still be selectable for depreciation. Ownership ≠ possession. The asset is still on the company's books.  
**Business case:** Required by accounting standards (IFRS/GAAP). Not allowing this makes the platform non-compliant for businesses that lease out assets.

---

### ENH-004: Add Image Upload to Asset Creation

**Current state:** No image upload field in the 4-step creation wizard, but the detail view has a broken image placeholder.  
**What's needed:** Add an optional image upload field (Step 3: Manufacturer Details). Support jpg/png. Display in the detail view.  
**Business case:** Physical verification of assets during audits. Especially important for equipment, vehicles, and valuable items.

---

### ENH-005: Add Bulk Actions for Assets

**Current state:** Each asset must be managed individually.  
**What's needed:** Checkbox selection on the asset list + bulk actions: Bulk Delete, Bulk Category Change, Bulk Status Update, Bulk Export.  
**Business case:** Companies with large asset registers need efficiency. Managing 500 assets one at a time is not feasible.

---

### ENH-006: Inventory Reorder Point Alerts

**Current state:** Inventory items have no minimum stock level or alert system.  
**What's needed:** Add "Reorder Level" and "Reorder Quantity" fields to items. Show alerts on dashboard when stock falls below reorder level.  
**Business case:** Prevents stockouts in production. A manufacturing company needs to know when to reorder raw materials before they run out.

---

### ENH-007: Inventory Stock Adjustment / Write-Off

**Current state:** No way to adjust stock without creating a production run or purchase.  
**What's needed:** A "Stock Adjustment" feature: Select item → Adjustment Type (Add/Remove/Write-Off) → Quantity → Reason → Date → Approved By.  
**Business case:** Covers breakage, theft, counting errors, donations, samples. Every warehouse needs this.

---

### ENH-008: Asset Barcode/QR Code Generation

**Current state:** Assets are identified only by auto-generated ID (AST/2026/0001).  
**What's needed:** Auto-generate a printable barcode or QR code for each asset that links to its detail page. Include a "Print Label" button.  
**Business case:** Physical asset tracking during audits. Scan the sticker on the laptop → see its full history, depreciation, maintenance schedule.

---

## 📊 SUMMARY: ALL BUGS TO ADD TO TRACKER

| Bug ID | Module | Description | Severity | Team |
|--------|--------|-------------|----------|------|
| AST-001 | Assets | "Asset Acquired" KPI shows 0 when Total Assets is 1 | Medium | Backend |
| AST-002 | Assets | Date off-by-one error across all sub-modules (timezone bug) | High | Backend |
| AST-003 | Assets | Edit option completely missing from asset action menu | High | Frontend |
| AST-004 | Assets | Asset detail view has no Back button | Low | Frontend |
| AST-005 | Assets | Broken image placeholder on asset detail view | Low | Frontend |
| AST-006 | Assets | "View" button on category cards gets stuck in infinite loading | High | Frontend |
| AST-007 | Assets | Leased assets hidden from Depreciation and Maintenance selection | High | Backend |
| AST-008 | Assets | Lease Return "Condition on Return" dropdown nearly unusable | Medium | Frontend |
| AST-009 | Assets | Leading zero in currency input fields | Low | Frontend |
| INV-001 | Inventory | Created items don't appear in list despite success modal | Critical | Backend |
| INV-002 | Inventory | "Failed to load inventory items" error intermittently | High | Backend |
| INV-003 | Inventory | "Created By" dropdown fails to persist selection | Medium | Frontend |
| INV-004 | Inventory | Cost/Sales Account dropdown selection timeouts | Medium | Frontend |

---

*All findings are from live browser testing with screenshot evidence. May 12, 2026.*
