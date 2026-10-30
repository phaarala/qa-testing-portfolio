# QA Testing Portfolio

[![API tests](https://github.com/phaarala/qa-testing-portfolio/actions/workflows/api-tests.yml/badge.svg)](https://github.com/phaarala/qa-testing-portfolio/actions/workflows/api-tests.yml) [![UI tests](https://github.com/phaarala/qa-testing-portfolio/actions/workflows/ui-tests.yml/badge.svg)](https://github.com/phaarala/qa-testing-portfolio/actions/workflows/ui-tests.yml)

Software testing projects by Paul Haarala: manual testing, SQL, API and UI test automation.

## Projects

| # | Project | What it shows | Tools | Status |
| --- | --- | --- | --- | --- |
| 01 | [Manual functional & cross-browser testing](01-manual-testing/README.md) | Exploratory testing, test planning, test case design, execution across accounts and browsers, defect reporting, summary reporting | Google Sheets, Jira, Chrome, Firefox, Edge, DevTools | Complete |
| 02 | [SQL test analytics](02-sql-test-analytics/README.md) | Test results and defects modeled in a relational database and analyzed with SQL | SQLite, DB Browser for SQLite | Complete |
| 03 | [API testing](03-api-testing/README.md) | Automated API tests: request chaining, status codes, response data, JSON schemas, negative and data-driven tests, run in CI | Postman, Newman, GitHub Actions, Jira | Complete |
| 04 | [UI test automation](04-ui-automation/README.md) | The 11 high-priority manual test cases automated with the Page Object Model, run in Chromium, Firefox and WebKit on every push | Playwright, Python, pytest, GitHub Actions | Complete |

## Project 1 at a glance

- 53 test cases written and executed; 79.2% pass rate
- 88 additional smoke checks across 4 test accounts and 4 browser configurations
- 18 defects logged in Jira, 2 of them Critical, each traced to the test that found it

## Project 2 at a glance

- Project 1's results loaded into a 4-table SQLite database: 53 test cases, 141 executions, 18 defects
- 8 SQL queries reproduce the test summary report: pass rate by feature, defects by severity and priority, results by account and browser
- A traceability query confirms every failure is linked to a Jira bug

## Project 3 at a glance

- 25 automated Postman tests covering all 8 endpoints of a booking API, chained from login through create, update and delete
- 9 defects logged in Jira, including bookings saved with a text price or with checkout before check-in
- Runs with Newman on every push through GitHub Actions, including a 5-row data-driven test

## Project 4 at a glance

- The 11 high-priority SauceDemo test cases from Project 1 automated with Playwright and pytest, each named with its manual test case ID
- Runs in Chromium, Firefox and WebKit on every push through GitHub Actions: 30 passed, 3 expected failures
- Known bug ST-4 tracked as a strict expected failure linked to Jira, so the build stays green and the bug stays visible

## Skills

Test planning · Test case design · Exploratory testing · Equivalence partitioning · Boundary value analysis · Cross-browser testing · Defect reporting · Severity and priority triage · Requirements traceability · API testing · UI test automation · Page Object Model · Python · pytest · Playwright · SQL · Postman · Newman · GitHub Actions · Jira · Chrome DevTools

## About me

I'm a QA tester based in Denver, Colorado. My work covers test planning, manual, exploratory and regression testing, defect management in Jira, SQL analysis of test results, automated API testing with Postman and Newman, and UI test automation with Playwright and Python. Both automated suites run in CI on every push. I hold the Microsoft Junior QA/Software Tester Professional Certificate and am preparing for the ISTQB Foundation Level exam.

## Contact

- LinkedIn: [linkedin.com/in/paul-haarala](https://www.linkedin.com/in/paul-haarala)
- Email: [paul.haarala@gmail.com](mailto:paul.haarala@gmail.com)
