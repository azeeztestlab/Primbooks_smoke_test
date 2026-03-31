# PrimBooks Smoke Test: Records Module & Security Audit

## 📊 Records & Data Integrity
- **Objective:** Stress-test input fields and data persistence boundaries.
- **Status:** Vulnerable to edge-case inputs.

### 1. Data Integrity Findings
- **[BUG] Negative Balances:** The "Opening Balance" field accepts negative numbers during edit mode, which can corrupt accounting charts.
- **[BUG] Integer Overflow:** Entering values exceeding 15 digits (e.g., `9,999,999,999,999,999`) results in silent truncation or incorrect scientific notation storage.
- **[UI] Date Picker:** Year selection beyond 2030 is functional but lacks a "Today" quick-jump button.

### 🛡️ Security Adversarial Testing
- **SQL Injection (SQLi):**
    - Payload: `' OR 1=1 --`
    - Result: ✅ **PASS**. The system treated the payload as a literal string. The authentication and query builders are properly parameterized.
- **Cross-Site Scripting (XSS):**
    - Payload: `<script>alert('XSS')</script>`
    - Result: ⚠️ **FAIL** (Front-end).
    - **Detail:** While the script is stored safely in the database (preventing execution on save), the **Records Table renders the raw HTML tags**. 
    - **Risk:** High. If a malicious user inputs a script, it will execute in the browser of any admin viewing that record. Output encoding is mandatory.

---
*Status: Detailed Security & Records Report*
