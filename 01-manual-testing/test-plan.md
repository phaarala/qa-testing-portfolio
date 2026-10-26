# SauceDemo Web Application: Test Plan

| Author | Version | Date | Status |
| --- | --- | --- | --- |
| Paul Haarala | 1.0 | October 20, 2026 | Draft |

PDF version: [test-plan.pdf](test-plan.pdf)

## 1. Objective

Validate SauceDemo's core end-to-end shopping flow: logging in, browsing the inventory page, adding and removing items in the cart, and the full checkout flow. Validate in the latest builds of Chrome, Firefox and Edge. Defects will be documented thoroughly enough for others to reproduce them.

## 2. Scope

### In scope
- Login and logout
- Product list and sorting
- Product detail
- Cart
- Checkout: information, overview and complete
- Side menu: All Items, Logout, Reset App State
- Session behavior: refresh, Back button, typing a URL directly
- PDF receipt (light check)

### Out of scope

| Item                                                | Reason                                                                                                     |
|-----------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Performance and load testing                        | No permission to load-test a public site.                                                                  |
| Security testing                                    | No permission, and it requires specialist tools.                                                           |
| Full accessibility audit                            | Only a basic keyboard-navigation check is included.                                                        |
| Native mobile apps                                  | Web-only plan; phone width is checked in browser DevTools.                                                 |
| External sites (About, social links)                | Only checked that each link opens.                                                                         |
| Real payment processing                             | The demo takes no real payments.                                                                           |
| Dynamic Catalog pages (Log #52)                    | Separate demo pages with no add-to-cart, so they are not part of the purchase flow. Listed as a follow-up. |
| Slow loading for performance_glitch_user (Log #57) | Recorded as an observation but not measured, since performance testing is out of scope.                    |

## 3. Approach
1. Timed exploratory sessions to learn the app's functionality and establish a baseline using standard_user.
2. Scripted functional test cases covering the happy path, negative testing, edge cases and equivalence partitioning.
3. Full execution as standard_user in Chrome.
4. Rerun of the product, cart and checkout cases with the other test accounts.
5. A cross-browser smoke suite (about 10 high-priority cases) in Chrome, Firefox and Edge, plus phone width in DevTools.
6. Defects logged in Jira with severity, priority, steps to reproduce and evidence.

## 4. Test environment

| Item             | Value                                                                          |
|------------------|--------------------------------------------------------------------------------|
| Application URL  | [https://www.saucedemo.com](https://www.saucedemo.com)                  |
| Operating system | Windows 11                                                                     |
| Browsers         | Chrome 155 · Firefox 158 · Edge 155                                            |
| Screen sizes     | 1920×1080 desktop · 375×667 phone (DevTools emulation)                         |
| Tools            | Google Sheets (cases, results) · Jira Cloud (defects) · Windows screen capture |

## 5. Test data

### Test accounts

| Account                 | Purpose in this plan                          | Observed in Session 3                                                      |
|-------------------------|-----------------------------------------------|----------------------------------------------------------------------------|
| standard_user           | Baseline: defines expected behavior           | All core flows work; used as the baseline                                  |
| locked_out_user         | Error handling for a blocked account          | Login blocked: “Sorry, this user has been locked out.” (Log #55)          |
| problem_user            | Product and checkout flows with known defects | Every product shows the same dog image (Log #56)                          |
| performance_glitch_user | Behavior under slow responses                 | Inventory page loads noticeably slower (Log #57)                          |
| error_user              | Error handling during actions                 | Last Name field won't accept text; checkout cannot be completed (Log #58) |
| visual_user             | Layout and visual differences                 | Cart icon overlaps the section below (Log #59)                            |

### Checkout input data

| Set     | Values                                                               |
|---------|----------------------------------------------------------------------|
| Valid   | First name “Jane” · Last name “Doe” · Postal code “12345”            |
| Invalid | Each field empty · spaces only · 300 characters · special characters |

## 6. Entry, exit and suspension criteria

| Criterion     | Condition                                                                                                                                                                                  |
|---------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Entry         | Site is reachable; test cases are written; browsers are installed and their versions recorded; the Jira project is ready.                                                                  |
| Exit          | 100% of High-priority cases executed; at least 90% of all cases executed; every failure has a linked Jira bug; every unexecuted case has a written reason; the summary report is complete. |
| Suspension    | If login fails for standard_user or the site is down for more than 1 hour, stop and mark the affected cases Blocked.                                                                       |

## 7. Deliverables
- Test plan (this document)
- Exploration log
- Test cases with results
- Browser matrix
- Jira defect reports
- Test summary report
- GitHub README

## 8. Risks

| Risk                                           | Impact                                  | Mitigation                                                                                         |
|------------------------------------------------|-----------------------------------------|----------------------------------------------------------------------------------------------------|
| No written requirements                        | Expected results could be wrong         | Use standard_user behavior and common e-commerce conventions; list assumptions; log open questions |
| Unclear field rules (e.g., postal code format) | Can't call a result pass or fail        | Record it as an assumption; flag it in the summary                                                 |
| The public demo may change without notice      | Results may not reproduce later         | Record date and browser version on every run; screenshot every failure                             |
| Single tester, no peer review                  | Blind spots                             | Use checklists and test design techniques; get the plan and cases reviewed                         |
| Limited time                                   | Not every case can run in every browser | Prioritize High cases; cross-browser runs the smoke suite only                                     |

## 9. Open questions and assumptions

Each assumption below sets the expected result used for pass/fail until the question is answered. Log numbers refer to the exploration log.

| Log #     | Question                                                                                  | Assumption                                                                                              |
|------------|-------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| 10         | Should login trim a trailing space?                                                       | No, so rejecting it counts as a pass.                                                                   |
| 21 / 32    | How does a customer buy 2 of the same item?                                               | A customer should be able to do this, so it is a potential bug.                                         |
| 26         | Should the sort choice persist when navigating to other pages?                            | Low priority and does not affect functionality, so not worth the time.                                  |
| 29         | Should the cart show a message when it is empty?                                          | Adding this would improve UX, accessibility and the look of the empty page.                             |
| 39         | Should the Checkout: Your Info fields allow unlimited characters?                         | Having no character limit risks memory overload in extreme edge cases.                                  |
| 40         | Should a name contain only special characters?                                            | Hyphens and apostrophes are valid; a name made only of symbols is not.                                  |
| 42         | Should postal codes be validated?                                                         | Postal codes should not be purely alphabetical, but letters are possible in international postal codes. |
| 44 / 48    | Should Cancel on Checkout: Your Info go to the same page as Cancel on Checkout: Overview? | Yes, because it makes the interface predictable.                                                        |
| 46         | What tax rate should customers be charged?                                                | Business compliance regulations require 8% tax on each purchase.                                        |
