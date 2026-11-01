# UI Test Automation: SauceDemo

![UI tests](https://github.com/phaarala/qa-testing-portfolio/actions/workflows/ui-tests.yml/badge.svg)

The 11 high-priority SauceDemo test cases from the [manual test cycle](../01-manual-testing/README.md), automated with Playwright and pytest using the Page Object Model and run in Chromium, Firefox and WebKit on every push through GitHub Actions.

| Tests | Browsers | Runs in CI | Known defects tracked |
| --- | --- | --- | --- |
| 11 (33 runs) | Chromium, Firefox, WebKit | Yes | 1 ([ST-4](../01-manual-testing/bug-reports/ST-4.md)) |

## Test suite

Each test is named with the ID of the manual test case it automates in [test-cases.csv](../01-manual-testing/test-cases.csv).

| Project 1 ID | Test | File | Result |
| --- | --- | --- | --- |
| LGN-01 | `test_lgn_01_login_with_valid_standard_user` | `test_login.py` | Pass |
| LGN-04 | `test_lgn_04_login_with_wrong_password` | `test_login.py` | Pass |
| PLS-01 | `test_pls_01_inventory_shows_six_complete_products` | `test_inventory.py` | Pass |
| CRT-01 | `test_crt_01_add_item_to_cart` | `test_cart.py` | Pass |
| CRT-02 | `test_crt_02_remove_item_from_inventory_page` | `test_cart.py` | Pass |
| CHK-01 | `test_chk_01_checkout_happy_path` | `test_checkout.py` | Pass |
| CHK-06 | `test_chk_06_item_total_is_sum_of_prices` | `test_checkout.py` | Pass |
| CHK-07 | `test_chk_07_total_includes_tax` | `test_checkout.py` | Pass |
| CHK-09 | `test_chk_09_checkout_with_empty_cart_is_rejected` | `test_checkout.py` | XFAIL → [ST-4](../01-manual-testing/bug-reports/ST-4.md) |
| MNU-01 | `test_mnu_01_logout_from_side_menu` | `test_menu.py` | Pass |
| MNU-02 | `test_mnu_02_back_button_after_logout` | `test_menu.py` | Pass |

Across the three browsers: **30 passed, 3 expected failures** (CHK-09 in each browser).

## Design

- **Page Object Model:** each SauceDemo page has one class in [`pages/`](pages) that holds its locators and user actions. Tests contain only the steps and the checks, so they read like the manual test cases.
- **Stable locators:** elements are found by their `data-test` attributes, which don't change when text or styling does.
- **Independent tests:** a `logged_in_page` fixture in [`conftest.py`](conftest.py) gives every test its own fresh, logged-in browser, so no test depends on another.
- **No fixed waits:** Playwright's `expect` retries until the page is ready, which avoids flaky timing failures.
- **Known defects stay visible:** CHK-09 asserts the correct behavior and is marked `xfail(strict=True)` with its Jira key. The build stays green, and the test turns red the day ST-4 is fixed, as a reminder to remove the marker.
- **Reproducible setup:** package versions are pinned in [`requirements.txt`](requirements.txt).

## Reports

- [HTML report](reports/report.html) of the latest three-browser run: 33 results, 30 passed, 3 expected failures. GitHub displays HTML files as code; download it and open it in a browser to view it.
- Every CI run uploads its report as a downloadable artifact on its run page under the **Actions** tab. When a test fails, the artifact also includes a screenshot and a Playwright trace, a step-by-step replay of the failure.

## How to run it

Requires Python 3.13 or later. On Windows:

```bash
py -m pip install -r requirements.txt
py -m playwright install chromium firefox webkit
py -m pytest --browser chromium --browser firefox --browser webkit --html=reports/report.html --self-contained-html
```

On macOS or Linux, use `python` instead of `py`. Add `--headed --slowmo 500` to watch the tests run in a visible browser.

## Tools

Python · pytest · Playwright · pytest-html · GitHub Actions
