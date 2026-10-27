-- 02_load.sql
-- Copies the raw imported data into the clean tables.

-- Test cases: derive a readable feature name from the ID prefix.
INSERT INTO test_cases (case_id, feature, title, priority, case_type, source)
SELECT
    case_id,
    CASE SUBSTR(case_id, 1, 3)
        WHEN 'LGN' THEN 'Login'
        WHEN 'PLS' THEN 'Product list'
        WHEN 'PDP' THEN 'Product detail'
        WHEN 'CRT' THEN 'Cart'
        WHEN 'CHK' THEN 'Checkout'
        WHEN 'MNU' THEN 'Side menu'
        WHEN 'SES' THEN 'Session'
    END,
    title,
    priority,
    case_type,
    source
FROM raw_test_cases;

-- Full run: every case as standard_user in Chrome at desktop size.
INSERT INTO executions (case_id, run_type, account, configuration, status)
SELECT case_id, 'Full', 'standard_user', 'Chrome 155 1920x1080', status
FROM raw_test_cases;

-- Account runs: turn the four account columns into rows ("unpivot").
INSERT INTO executions (case_id, run_type, account, configuration, status)
SELECT case_id, 'Account', 'problem_user',            'Chrome 155 1920x1080', problem_user            FROM raw_account_matrix
UNION ALL
SELECT case_id, 'Account', 'error_user',              'Chrome 155 1920x1080', error_user              FROM raw_account_matrix
UNION ALL
SELECT case_id, 'Account', 'visual_user',             'Chrome 155 1920x1080', visual_user             FROM raw_account_matrix
UNION ALL
SELECT case_id, 'Account', 'performance_glitch_user', 'Chrome 155 1920x1080', performance_glitch_user FROM raw_account_matrix;

-- Browser runs: same idea, one row per browser setup.
INSERT INTO executions (case_id, run_type, account, configuration, status)
SELECT case_id, 'Browser', 'standard_user', 'Chrome 155 1920x1080',  chrome_desktop  FROM raw_browser_matrix
UNION ALL
SELECT case_id, 'Browser', 'standard_user', 'Firefox 158 1920x1080', firefox_desktop FROM raw_browser_matrix
UNION ALL
SELECT case_id, 'Browser', 'standard_user', 'Edge 155 1920x1080',    edge_desktop    FROM raw_browser_matrix
UNION ALL
SELECT case_id, 'Browser', 'standard_user', 'Chrome 155 375x667',    chrome_mobile   FROM raw_browser_matrix;

-- Defects and links: straight copies.
INSERT INTO defects (bug_id, summary, severity, priority)
SELECT bug_id, summary, severity, priority FROM raw_defects;

INSERT INTO case_defects (case_id, bug_id)
SELECT case_id, bug_id FROM raw_case_defects;

-- Check the load. Expected: 53, 141, 18, 19.
SELECT 'test_cases'   AS table_name, COUNT(*) AS row_count FROM test_cases
UNION ALL SELECT 'executions',   COUNT(*) FROM executions
UNION ALL SELECT 'defects',      COUNT(*) FROM defects
UNION ALL SELECT 'case_defects', COUNT(*) FROM case_defects;
