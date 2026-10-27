# SQL Test Analytics: SauceDemo Results

The results of the [Project 1 manual test cycle](../01-manual-testing/README.md), loaded into a SQLite database and analyzed with SQL. Every number in the Project 1 test summary report can be reproduced with a query here.

## Data model

| Table | One row per | Rows |
| --- | --- | --- |
| `test_cases` | Test case designed in Project 1 | 53 |
| `executions` | Time a test case was run, under one account and one browser setup | 141 |
| `defects` | Jira bug | 18 |
| `case_defects` | Link between a test case and a bug it found | 19 |

`case_defects` is a link table because the relationship is many-to-many: CHK-01 found three bugs, and ST-13 was found by two test cases.

## Questions answered

| # | Question | Result |
| --- | --- | --- |
| Q1 | What is the pass rate for each feature? | [results/q1.csv](results/q1.csv) |
| Q2 | Which High-priority cases failed, and which bugs did they find? | [results/q2.csv](results/q2.csv) |
| Q3 | How do the defects break down by severity and priority? | [results/q3.csv](results/q3.csv) |
| Q4 | How did the smoke suite do under each test account? | [results/q4.csv](results/q4.csv) |
| Q5 | Is there any failure without a linked bug? (Expected: none) | [results/q5.csv](results/q5.csv) |
| Q6 | How did the smoke suite do in each browser configuration? | [results/q6.csv](results/q6.csv) |
| Q7 | Which test cases found more than one bug? | [results/q7.csv](results/q7.csv) |
| Q8 | Which features have the most bugs? | [results/q8.csv](results/q8.csv) |

All queries are in [sql/03_queries.sql](sql/03_queries.sql).

## Findings
- Checkout feature has the highest failure rate at 52.9%, including the two critical bugs found from the entire test suite and the most distinct bugs out of any other feature.
- No browser or viewport-specific bugs were found in this testing cycle
- All defects revealed by test cases have been logged, via the traceability check from Q5
- problem_user and error_user both fail the smoke-test suite significanty, by design

## How to rebuild the database

1. Install [DB Browser for SQLite](https://sqlitebrowser.org/).
2. Create a new database named `qa_results.db`.
3. Import each file in `data/` with **File → Import → Table from CSV file** ("Column names in first line" ticked). Each becomes a table with the file's name, such as `raw_test_cases`.
4. In **Execute SQL**, open and run `sql/01_schema.sql`, then `sql/02_load.sql`. The last result should show 53, 141, 18 and 19 rows.
5. Open `sql/03_queries.sql` and run each query.

The finished database is included as `qa_results.db`.

## Tools

SQLite · DB Browser for SQLite · SQL (JOIN, LEFT JOIN, GROUP BY, HAVING, CASE, UNION ALL, conditional aggregation)
