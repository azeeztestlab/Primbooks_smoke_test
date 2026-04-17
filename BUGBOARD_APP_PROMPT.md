# Project Prompt: QA Bug Tracker — Full Web App

## Copy-paste this when you're ready to start:

---

I want to build a full web application called **"BugBoard"** (or whatever name we decide). It's a lightweight QA bug tracker for small dev teams — think "Jira but simple."

### Reference
I already have a working HTML prototype at:
`C:\Users\G PAPA\.gemini\antigravity\scratch\PrimBooks\bug_tracker.html`

It's also live at: `https://azeeztestlab.github.io/Primbooks_smoke_test/bug_tracker.html`

This prototype has: bug table with clickable status dropdowns (Open/Fixed/Closed/Void), severity badges, team assignment, expandable details (steps to reproduce, expected/actual), filters, search, add/edit/delete bugs, export to markdown, and meeting audit export.

### What I want the full app to have (on top of the prototype):
1. **Real backend + database** — so multiple users share the same bug data
2. **User authentication** — login with email/password, roles (QA Lead, Developer, Viewer)
3. **Real-time sync** — when someone changes a status, everyone sees it live
4. **Comments on bugs** — devs can reply "Fixed in commit abc123"
5. **File attachments** — upload screenshots as evidence
6. **Notifications** — email or in-app when a bug assigned to you changes
7. **Dashboard** — charts showing open vs fixed vs closed over time, bugs by module, etc.
8. **Projects** — support multiple projects (not just PrimBooks)
9. **Activity log** — who changed what and when
10. **Export** — Markdown, CSV, and PDF reports

### Tech preferences
- Use whatever modern stack you recommend (Next.js, Vite, etc.)
- Dark mode design like the current prototype
- Mobile responsive
- Deploy-ready (Vercel, Railway, or similar)

### Target users
Small to medium dev teams (5-30 people) in Africa and globally who find Jira too complex and expensive. Pricing model: free tier for up to 3 projects, paid for unlimited.

Build me the full app. Start with the plan.

---
