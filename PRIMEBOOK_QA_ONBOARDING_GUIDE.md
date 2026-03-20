# PrimeBook QA Onboarding — Meeting Prep & Kickstart Guide

**Your Role:** QA Tester for PrimeBook  
**Prepared:** March 17, 2026  
**Product:** PrimeBook — Cloud-based Financial & Business Management Platform for SMEs

---

## 1. What PrimeBook Actually Is (Plain English)

PrimeBook is like **QuickBooks + Zoho + a simple HR system** combined into one web app. It is built for **small and medium businesses** (think: shops, agencies, small factories) who currently use Excel sheets and notebooks to track money, employees, and customers.

### What it does in simple terms:
| Module | What it does (Plain English) |
|---|---|
| **Dashboard** | Home screen showing business health — sales, expenses, customers at a glance |
| **Records** | Where you enter financial transactions (money in, money out) |
| **CRM** | Managing customers — creating orders, invoices, quotes, credit notes |
| **Production** | For businesses that manufacture things — tracking materials and assembly |
| **Purchases** | Tracking business spending, managing vendors/suppliers |
| **Finance** | The accounting engine — banking, taxes, chart of accounts, journals |
| **HR & Payroll** | Employee management — attendance, salaries, loans, leave |
| **Inventory** | Stock tracking and adjustments |
| **Bank Reconciliation** | Matching internal records with bank statements (their **biggest selling point**) |
| **Audit Trail** | Logs of who did what and when (accountability) |
| **Reports** | Sales, expense, vendor, and customer reports |
| **Asset Management** | Tracking company property/equipment and depreciation |
| **Settings** | Team management, notifications, subscription config |

### Key Fintech Terms You'll Encounter:
| Term | Meaning |
|---|---|
| **Chart of Accounts** | A list of all financial categories a company uses (e.g., "Office Rent", "Sales Revenue") |
| **Journal Entry** | A record of a financial transaction in the accounting system |
| **Bank Reconciliation** | Comparing your internal records with actual bank statement to find mismatches |
| **Invoice** | A bill you send to a customer asking them to pay |
| **Credit Note** | A document that cancels or reduces a previous invoice |
| **Quotation** | A price estimate sent to a customer before they buy |
| **WHT (Withholding Tax)** | Tax deducted at the source of income (Nigerian tax requirement) |
| **VAT** | Value Added Tax — a tax on goods and services |
| **Bill of Materials (BOM)** | A list of raw materials needed to produce a product |
| **Depreciation** | The decrease in value of an asset over time |
| **PWA** | Progressive Web App — a website that behaves like a mobile app |
| **KPI** | Key Performance Indicator — a measurable value showing performance |

---

## 2. What You MUST Ask For in the Meeting

### 🔴 Critical — Cannot Start Without These

**1. Access to Staging/Dev Environment**
> "Can I get access to the staging environment or dev server URL so I can begin testing? I understand the production site isn't live yet."

**2. Login Credentials / Test Accounts**
> "Can I get test accounts with different roles (Admin, Accountant, HR, Auditor) so I can test role-based access and permissions?"

**3. Communication Channel**
> "What's the primary communication tool — Slack, Discord, Teams, WhatsApp? Where do I report bugs and ask questions?"

**4. Bug Reporting Tool & Process**
> "What tool does the team use for bug tracking — Jira, Linear, Notion, GitHub Issues? Is there a specific format or template I should follow?"

---

### 🟡 Important — Should Get Before Week 1 Ends

**5. Design Files (Figma/UI Mockups)**
> "Are there Figma designs or UI mockups I can reference? I need to compare the implemented UI against the approved designs."

**6. API Documentation**
> "Is there API documentation (Swagger/Postman collection) I can review? This will help me understand what the backend expects and test edge cases."

**7. Current Build Status / Known Issues**
> "Is there a list of what's currently working vs. what's still in development? The PRD mentions several modules marked 'not started' or 'pending' — should I test those areas or skip them for now?"

**8. Test Data / Seed Data**
> "Is there pre-loaded test data (sample customers, products, transactions), or do I need to create everything from scratch?"

**9. Tech Stack Information**
> "What technologies is the app built with (React, Vue, Next.js, etc.)? This helps me understand console errors and debug issues."

---

### 🟢 Good to Ask — Shows Initiative

**10. Sprint/Release Cycle**
> "How often does the team release updates — weekly sprints, bi-weekly? When is the next deployment to staging?"

**11. QA Scope Priority**
> "Which modules should I prioritize testing first? I see Bank Reconciliation is the 'strongest selling point' — should I start there?"

**12. Other QA Team Members**
> "Am I the only QA, or is there a team? If there's a team, how do we divide testing responsibilities?"

**13. User Roles & Permissions Matrix**
> "Is there a document that lists exactly what each role (Admin, Accountant, HR, Auditor) can and cannot do?"

**14. Mobile/PWA Testing**
> "Since PrimeBook is a PWA, should I also test on mobile browsers? Which devices/browsers should I prioritize?"

**15. Regulatory Requirements**
> "Are there specific Nigerian compliance requirements (CBN, FIRS) I should be aware of when testing tax calculations and financial reports?"

---

## 3. Your QA Strategy Overview

Based on the PRD, here's how I recommend we structure your testing:

### Phase 1: Smoke Test (Day 1-3)
- Can you sign up and log in?
- Does the dashboard load?
- Can you navigate to all 13 modules?
- Do all menu links work?
- Any console errors on load?

### Phase 2: Core Module Testing (Week 1-2)
Test these in order of business priority:

| Priority | Module | Why |
|---|---|---|
| 1 | **Authentication** | Can't test anything if login is broken |
| 2 | **Dashboard** | First thing users see |
| 3 | **Records** | Foundation — feeds into everything |
| 4 | **CRM** (Orders, Invoices, Customers) | Core revenue flow |
| 5 | **Bank Reconciliation** | Their #1 selling point |
| 6 | **Finance** (Banking, Tax, Chart of Accounts) | Core accounting |
| 7 | **Purchases** (Expenses, Vendors) | Core spending flow |
| 8 | **HR & Payroll** | Employee management |
| 9 | **Audit Trail** | Accountability feature |
| 10 | **Reports** | Output validation |
| 11 | **Inventory** | Marked "not started" in PRD |
| 12 | **Production** | Niche feature |
| 13 | **Asset Management** | Secondary feature |

### Phase 3: Cross-Module Testing (Week 3+)
- Does creating an order in CRM correctly reflect in Finance?
- Does a payroll run show up in the expense reports?
- Does bank reconciliation match actual transaction records?

---

## 4. PRD Red Flags & Incomplete Areas

From the PRD, these modules/features are **not yet built or incomplete**. Confirm their status in the meeting:

| Module/Feature | PRD Status | Your Question |
|---|---|---|
| Inventory list & adjustments | **Not started** | "Should I skip inventory testing entirely?" |
| Reports (all 4 types) | **Frontend not started** | "Are reports testable or just UI shells?" |
| Expenses | **Frontend pending** | "Is the expense flow functional?" |
| Recurring & Bulk Expenses | **Not started** | "Skip for now?" |
| Banking (Finance) | **Frontend partial** | "What parts work?" |
| Journal (Finance) | **Frontend not started** | "Skip?" |
| Accounts Module | **Not started** | "Skip?" |
| Invoice (CRM) | **Frontend rework pending** | "Can I test the old version or wait?" |
| Forgot Password | **Pending** | "Is password reset testable?" |
| Customization (Settings) | **Pending UI** | "Skip?" |

---

## 5. Quick-Reference: Your First Day Action Plan

```
☐ 1. Get staging URL + test credentials
☐ 2. Join communication channel (Slack/Discord/Teams)
☐ 3. Get access to bug tracking tool (Jira/Linear/etc.)
☐ 4. Get Figma/design file access
☐ 5. Ask for API documentation
☐ 6. Confirm which modules to test first
☐ 7. Confirm bug report format/template
☐ 8. Do a quick smoke test (login, navigate all modules)
☐ 9. Document initial findings
☐ 10. Share first-day report with team
```

---

## 6. Important Note

> **This is a fintech product.** Financial accuracy is everything. Unlike a marketplace where a broken button is annoying, a miscalculation in PrimeBook could mean a business reports wrong taxes or pays employees incorrectly. Every number, every calculation, every decimal point matters. Test with that mindset.
