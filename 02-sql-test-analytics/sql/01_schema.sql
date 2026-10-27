-- 01_schema.sql
-- Creates the clean tables. Run after importing the five raw_ tables.
-- Safe to rerun: it drops and recreates the clean tables (the raw_ tables are untouched).

DROP TABLE IF EXISTS case_defects;
DROP TABLE IF EXISTS executions;
DROP TABLE IF EXISTS defects;
DROP TABLE IF EXISTS test_cases;

-- One row per test case designed in Project 1.
CREATE TABLE test_cases (
    case_id    TEXT PRIMARY KEY,
    feature    TEXT NOT NULL,
    title      TEXT NOT NULL,
    priority   TEXT NOT NULL CHECK (priority IN ('High', 'Medium', 'Low')),
    case_type  TEXT NOT NULL CHECK (case_type IN ('Positive', 'Negative', 'Edge')),
    source     TEXT
);

-- One row per time a test case was run, under one account and one browser setup.
CREATE TABLE executions (
    execution_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    case_id        TEXT NOT NULL REFERENCES test_cases (case_id),
    run_type       TEXT NOT NULL CHECK (run_type IN ('Full', 'Account', 'Browser')),
    account        TEXT NOT NULL,
    configuration  TEXT NOT NULL,
    status         TEXT NOT NULL CHECK (status IN ('Pass', 'Fail', 'Blocked'))
);

-- One row per Jira bug.
CREATE TABLE defects (
    bug_id    TEXT PRIMARY KEY,
    summary   TEXT NOT NULL,
    severity  TEXT NOT NULL CHECK (severity IN ('Critical', 'High', 'Medium', 'Low')),
    priority  TEXT NOT NULL CHECK (priority IN ('High', 'Medium', 'Low'))
);

-- Links test cases to the bugs they found. One case can find several bugs,
-- and one bug can be found by several cases, so this is a separate table.
CREATE TABLE case_defects (
    case_id  TEXT NOT NULL REFERENCES test_cases (case_id),
    bug_id   TEXT NOT NULL REFERENCES defects (bug_id),
    PRIMARY KEY (case_id, bug_id)
);
