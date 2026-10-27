-- 03_queries.sql
-- Questions about Project 1's results, answered with SQL.
-- Run one query at a time: highlight the whole query, then press Ctrl+Return.

-- Q1. Pass rate by feature, for the full run (standard_user, Chrome).
SELECT
    tc.feature,
    COUNT(*)                                                AS cases,
    SUM(e.status = 'Pass')                                  AS passed,
    SUM(e.status = 'Fail')                                  AS failed,
    ROUND(100.0 * SUM(e.status = 'Pass') / COUNT(*), 1)     AS pass_rate_pct
FROM executions AS e
JOIN test_cases AS tc ON tc.case_id = e.case_id
WHERE e.run_type = 'Full'
GROUP BY tc.feature
ORDER BY pass_rate_pct, tc.feature;

-- Q2. High-priority cases that failed in the full run, with their bugs.
SELECT
    tc.case_id,
    tc.title,
    cd.bug_id,
    d.severity,
    d.priority AS bug_priority
FROM executions AS e
JOIN test_cases AS tc      ON tc.case_id = e.case_id
LEFT JOIN case_defects AS cd ON cd.case_id = e.case_id
LEFT JOIN defects AS d     ON d.bug_id = cd.bug_id
WHERE e.run_type = 'Full'
  AND e.status = 'Fail'
  AND tc.priority = 'High';

-- Q3. Defects by severity and priority (the grid from the summary report).
SELECT
    severity,
    SUM(priority = 'High')   AS high_priority,
    SUM(priority = 'Medium') AS medium_priority,
    SUM(priority = 'Low')    AS low_priority,
    COUNT(*)                 AS total
FROM defects
GROUP BY severity
ORDER BY CASE severity
    WHEN 'Critical' THEN 1
    WHEN 'High'     THEN 2
    WHEN 'Medium'   THEN 3
    WHEN 'Low'      THEN 4
END;

-- Q4. Smoke-suite results by test account.
SELECT
    account,
    SUM(status = 'Pass')    AS passed,
    SUM(status = 'Fail')    AS failed,
    SUM(status = 'Blocked') AS blocked
FROM executions
WHERE run_type = 'Account'
GROUP BY account
ORDER BY passed;

-- Q5. Traceability check: failures with no linked bug.
-- A correct project returns ZERO rows. An empty result here is a passing test.
SELECT
    e.case_id,
    e.run_type,
    e.account,
    e.configuration
FROM executions AS e
LEFT JOIN case_defects AS cd ON cd.case_id = e.case_id
WHERE e.status = 'Fail'
  AND cd.bug_id IS NULL;

-- Q6. Smoke-suite results by browser configuration.
SELECT
    configuration,
    SUM(status = 'Pass')    AS passed,
    SUM(status = 'Fail')    AS failed,
    SUM(status = 'Blocked') AS blocked
FROM executions
WHERE run_type = 'Browser'
GROUP BY configuration
ORDER BY passed, configuration;

-- Q7. Test cases linked to more than one bug, most bugs first.
SELECT
    case_id,
    COUNT(*) AS defect_count
FROM case_defects
GROUP BY case_id
HAVING COUNT(*) > 1
ORDER BY defect_count DESC, case_id;

-- Q8. Number of distinct bugs found in each feature, most first.
SELECT
    tc.feature,
    COUNT(DISTINCT cd.bug_id) AS distinct_bugs
FROM test_cases AS tc
JOIN case_defects AS cd ON cd.case_id = tc.case_id
GROUP BY tc.feature
ORDER BY distinct_bugs DESC, tc.feature;
