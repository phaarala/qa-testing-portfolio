# Test Summary Report: SauceDemo Web Application

| Tester | Test window | Report date | Test plan |
| --- | --- | --- | --- |
| Paul Haarala | October 20–26, 2026 | October 26, 2026 | [test-plan.md](test-plan.md) |

## 1. Summary

Testing met every exit criterion in the test plan. Of 53 test cases run as standard_user in Chrome, 42 passed (79.2%) and 11 failed. Smoke runs across 4 test accounts and 4 browser configurations added 88 more checks. In total, 18 defects were logged in Jira: 2 Critical, 5 High, 7 Medium and 4 Low severity.

## 2. What was tested

| Activity | Coverage | Environment |
| --- | --- | --- |
| Exploratory testing | 3 time-boxed sessions of 45 minutes; 59 logged observations | Windows 11 · Firefox 158 · 1920×1080 |
| Scripted functional testing | 53 test cases across 7 features | standard_user · Windows 11 · Chrome 155 · 1920×1080 |
| Account smoke testing | 11 High-priority cases × 4 test accounts = 44 checks | Windows 11 · Chrome 155 · 1920×1080 |
| Cross-browser smoke testing | 11 High-priority cases × 4 configurations = 44 checks | Chrome 155, Firefox 158, Edge 155 at 1920×1080; Chrome 155 at 375×667 |

Not tested, as planned (Test Plan §2): performance and load, security, a full accessibility audit, native mobile apps, the Dynamic Catalog pages and real payment processing. locked_out_user was covered by LGN-06 only, since it cannot log in by design.

## 3. Results by feature

standard_user, Chrome 155, 1920×1080. Full results: [test-cases.csv](test-cases.csv).

| Feature | Cases | Passed | Failed | Pass rate |
| --- | --- | --- | --- | --- |
| Login | 11 | 10 | 1 | 91% |
| Product list + sorting | 6 | 6 | 0 | 100% |
| Product detail | 5 | 5 | 0 | 100% |
| Cart | 8 | 7 | 1 | 88% |
| Checkout | 17 | 9 | 8 | 53% |
| Side menu | 4 | 3 | 1 | 75% |
| Session behavior | 2 | 2 | 0 | 100% |
| **Total** | **53** | **42** | **11** | **79.2%** |

All 11 High-priority cases were executed; 10 passed. The one High-priority failure is CHK-09 (checkout with an empty cart, [ST-4](bug-reports/README.md#st-4)). Checkout accounts for 8 of the 11 failures, mostly missing input validation on Checkout: Your Information.

## 4. Results by account and browser

**Test accounts** ([account-matrix.csv](account-matrix.csv)): the 11 High-priority cases per account.

| Account | Passed | Failed | Blocked | Defects |
| --- | --- | --- | --- | --- |
| problem_user | 5 | 3 | 3 | ST-12, ST-15, ST-17 |
| error_user | 8 | 3 | 0 | ST-4, ST-13, ST-14, ST-15 |
| visual_user | 10 | 1 | 0 | ST-16, ST-18 |
| performance_glitch_user | 11 | 0 | 0 | None |

problem_user's three Blocked cases (CHK-06, CHK-07, CHK-09) could not run because [ST-12](bug-reports/README.md#st-12) stops checkout before those steps. Neither problem_user nor error_user can complete a purchase.

**Browsers** ([browser-matrix.csv](browser-matrix.csv)): the same 11 cases as standard_user.

| Configuration | Passed | Failed |
| --- | --- | --- |
| Chrome 155 1920×1080 | 10 | 1 |
| Firefox 158 1920×1080 | 10 | 1 |
| Edge 155 1920×1080 | 10 | 1 |
| Chrome 155 375×667 | 10 | 1 |

The only failure, CHK-09, fails identically in every configuration. No browser-specific defects were found.

## 5. Defects

18 defects, by severity and priority. Full list: [bug-reports](bug-reports/README.md).

| Severity \ Priority | High | Medium | Low | Total |
| --- | --- | --- | --- | --- |
| Critical | 2 | – | – | **2** |
| High | 2 | 3 | – | **5** |
| Medium | – | 3 | 4 | **7** |
| Low | – | 1 | 3 | **4** |
| **Total** | **4** | **7** | **7** | **18** |

Most serious:

- **[ST-12](bug-reports/README.md#st-12)** and **[ST-13](bug-reports/README.md#st-13)** (Critical): problem_user and error_user cannot complete checkout.
- **[ST-4](bug-reports/README.md#st-4)** (High severity, High priority): an order completes with an empty cart, for standard_user in every browser.
- **[ST-16](bug-reports/README.md#st-16)** (High, High): visual_user sees different prices on the product list and the product detail page.

Five defects ([ST-3](bug-reports/README.md#st-3), [ST-6](bug-reports/README.md#st-6), [ST-7](bug-reports/README.md#st-7), [ST-8](bug-reports/README.md#st-8), [ST-9](bug-reports/README.md#st-9)) are **assumption-based**: no written requirement exists, so their expected results come from Test Plan §9 and need confirmation from a product owner.

## 6. Exit criteria (Test Plan §6)

| Criterion | Status | Evidence |
| --- | --- | --- |
| 100% of High-priority cases executed | Met | 11 of 11 executed |
| At least 90% of all cases executed | Met | 53 of 53 executed (100%) |
| Every failure has a linked Jira bug | Met | Bug ID column in [test-cases.csv](test-cases.csv) and [matrix-failures.csv](matrix-failures.csv) |
| Every unexecuted case has a written reason | Met | 3 Blocked account cases, each marked "Blocked by ST-12" |
| Summary report complete | Met | This document |

## 7. Open risks

- **Assumption-based expected results:** five defects depend on Test Plan §9 assumptions that no stakeholder has confirmed.
- **Public demo site:** SauceDemo can change without notice, so results may not reproduce later. Every result records its browser and version, and every failure has evidence.
- **Single tester:** no peer review of cases or results.

## 8. Recommendation

**Not ready for release.** Testing is complete and met every exit criterion in the test plan. However, those criteria measure how much was tested, not the quality of the product. Four High-priority defects remain open in the core purchase flow.

| Group | Defects | Action |
| --- | --- | --- |
| Release blockers (High priority) | [ST-4](bug-reports/README.md#st-4), [ST-12](bug-reports/README.md#st-12), [ST-13](bug-reports/README.md#st-13), [ST-16](bug-reports/README.md#st-16) | Fix and retest before release |
| Medium priority | [ST-5](bug-reports/README.md#st-5), [ST-9](bug-reports/README.md#st-9), [ST-10](bug-reports/README.md#st-10), [ST-11](bug-reports/README.md#st-11), [ST-14](bug-reports/README.md#st-14), [ST-15](bug-reports/README.md#st-15), [ST-17](bug-reports/README.md#st-17) | Fix in the next cycle. ST-11 can share a fix with ST-4: reject any order with an empty cart. |
| Low priority | [ST-1](bug-reports/README.md#st-1), [ST-2](bug-reports/README.md#st-2), [ST-3](bug-reports/README.md#st-3), [ST-6](bug-reports/README.md#st-6), [ST-7](bug-reports/README.md#st-7), [ST-8](bug-reports/README.md#st-8), [ST-18](bug-reports/README.md#st-18) | Add to the backlog |

Before fixing the five assumption-based defects (ST-3, ST-6, ST-7, ST-8, ST-9), a product owner should confirm the expected behavior in Test Plan §9.

**Retest scope after fixes:** rerun every failed case, then the 11-case smoke suite across all 4 test accounts and 4 browser configurations.
