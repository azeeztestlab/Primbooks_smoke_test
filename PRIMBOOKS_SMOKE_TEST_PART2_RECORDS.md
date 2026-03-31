# PrimBooks — Phase 2 Smoke Test Extension (Records Module)

**Date:** March 30, 2026  
**Module:** Records (`/record`)  
**Objective:** Adversarial CRUD Testing

---

## 1. Overview
Following the initial Phase 1 and the dashboard checks in Phase 2, this extension focuses specifically on the **Records** module. The goal was to perform adversarial testing (SQLi, XSS, boundary limits, and negative data types) to ensure the application handles malicious input gracefully without crashing.

## 2. Testing Summary

A complete CRUD (Create, Read, Update, Delete) cycle was executed with the following vectors:

### 🛡️ XSS & SQLi Resilience (Create/Update)
- **XSS Payloads:** Submitted payloads such as `<script>alert('XSS_PRODUCT')</script>` and `<img src=x onerror=alert('UPDATE_XSS')>`.
  - **Result:** ✅ Pass. The application successfully escaped the input in both confirmation modals and the main records table. No scripts were executed.
- **SQLi Payloads:** Injected `' OR 1=1 --` into the description field.
  - **Result:** ✅ Pass. Handled as a literal string. 

### 🔢 Numeric Validation (Create/Update)
- **Non-Numeric Characters:** 
  - **Result:** ✅ Pass. Appropriately blocked in numeric fields like `Selling Price` and `Quantity`.
- **Minimum Value Consistency:**
  - **Result:** 🟡 Warning. The Create form enforces a minimum value of `0.01` for `Selling Price`. However, the Update/Edit form for **`Opening Balance` allows negative values** (e.g., `-100.00`). This is inconsistent.
- **Large Value Boundaries:**
  - **Result:** 🟡 Warning. Extremely large numbers (e.g., 15 nines) entered in `Opening Balance` are truncated/capped to `9,999,999,999.99` upon saving without displaying a warning message to the user.

### ✨ Read & Delete
- **Read:** Maliciously crafted data strings are safely rendered in the UI and are fully searchable.
- **Delete:** The application presents a confirmation modal before deletion. Deletion functions exactly as expected, completely removing the record.

## 3. UX Observations
- **Hidden Action Menu:** The "Action" column containing the Edit and Delete options is located at the far right of the table. In some viewports, this requires horizontal scrolling, making it slightly difficult to discover for new users.

---

## 4. Key Findings & Recommendations

| Finding | Severity | Description | Recommendation |
| :--- | :--- | :--- | :--- |
| **Inconsistent Validation** | Medium | `Opening Balance` allows negative values during updating, unlike other numeric fields. | Apply the same `>= 0.01` validation logic across all monetary input fields for both create and update operations. |
| **Numeric Truncation** | Low | Large numbers are silently truncated. | Add a visual character/number limit or validation error for bounds exceeding the database column limit. |
| **Excellent XSS Resilience** | - | Robust handling of script injections. | Keep current string sanitation methods. |
| **Action Column UX** | Info | Action menu requires horizontal scrolling on smaller screens. | Consider pinning the Action column to the right side of the table so it is always visible. |
