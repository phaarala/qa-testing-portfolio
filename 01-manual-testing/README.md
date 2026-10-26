# Manual Functional & Cross-Browser Testing: SauceDemo

Manual testing of [SauceDemo](https://www.saucedemo.com), a practice e-commerce site, from exploration through test planning, test design, execution, defect reporting and a final summary report.

| Test cases | Pass rate | Defects logged | Accounts tested | Browser configurations |
| --- | --- | --- | --- | --- |
| 53 | 79.2% | 18 (2 Critical) | 5 | 4 |

## How I tested it

1. **Explored first.** SauceDemo has no written requirements, so I ran three time-boxed exploratory sessions to learn how it behaves and record questions. → [exploration-log.csv](exploration-log.csv)
2. **Planned.** I wrote a test plan setting scope, approach, environment, entry and exit criteria, and the assumptions I'd use where requirements were missing. → [test-plan.md](test-plan.md)
3. **Designed test cases.** 53 cases using positive and negative testing, equivalence partitioning and boundary values, each traced to the log observation or plan assumption it came from. → [test-cases.csv](test-cases.csv)
4. **Executed** every case as standard_user in Chrome, then reran the 11 High-priority cases with 4 test accounts and across Firefox, Edge and a 375×667 phone viewport. → [account-matrix.csv](account-matrix.csv), [browser-matrix.csv](browser-matrix.csv)
5. **Reported defects** in Jira with severity, priority, steps to reproduce and evidence, grouping failures by root cause and linking every failure to its bug. → [bug-reports](bug-reports/README.md)
6. **Summarized** results against the plan's exit criteria, with a release recommendation. → [test-summary-report.md](test-summary-report.md)

### Exploratory sessions

| Session | Charter | Time box |
| --- | --- | --- |
| S1 | Explore login, product list and product detail as standard_user to learn how they work and find test ideas | 45 minutes |
| S2 | Explore cart, checkout flow and the side menu as standard_user to learn how they work and find test ideas | 45 minutes |
| S3 | Explore the log in process for each of the different users and note any immediate differences between each user experience | 45 minutes |

## Key findings

- **Checkout can't be completed** for two of the test accounts ([ST-12](bug-reports/README.md#st-12), [ST-13](bug-reports/README.md#st-13), both Critical).
- **An order completes with an empty cart**, in every browser ([ST-4](bug-reports/README.md#st-4)).
- **Checkout accepts invalid customer details**: spaces only, numbers or symbols as names, letters-only postal codes, no length limit ([ST-5](bug-reports/README.md#st-5) to [ST-9](bug-reports/README.md#st-9)).

## Files

| File | What it is |
| --- | --- |
| [test-plan.md](test-plan.md) · [PDF](test-plan.pdf) | Test plan |
| [exploration-log.csv](exploration-log.csv) | 59 observations from 3 exploratory sessions |
| [test-cases.csv](test-cases.csv) | 53 test cases with results and bug IDs |
| [account-matrix.csv](account-matrix.csv) | Smoke suite across 4 test accounts |
| [browser-matrix.csv](browser-matrix.csv) | Smoke suite across 4 browser configurations |
| [matrix-failures.csv](matrix-failures.csv) | Details of every account and browser failure |
| [bug-reports/](bug-reports/README.md) | Defect index and Jira export |
| [test-summary-report.md](test-summary-report.md) | Results, exit criteria and recommendation |
| [evidence/](evidence/README.md) | Screenshots and recordings |
| [SauceDemo_Test_Cases.xlsx](SauceDemo_Test_Cases.xlsx) | The full workbook, with formatting |

## Next

The 11 High-priority cases become an automated Playwright suite in a later project in this portfolio.
