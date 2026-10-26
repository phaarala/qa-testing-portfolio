# Defect Reports

18 defects logged in Jira during manual testing of SauceDemo. Complete reports, with steps to reproduce, expected and actual results, and evidence, are in [jira-export.csv](jira-export.csv).

| Key | Summary | Severity | Priority | Test case(s) | Found with |
| --- | --- | --- | --- | --- | --- |
| <a id="st-1"></a>ST-1 | [Login] Cannot login using Enter key unless pressing Tab | Medium | Low | LGN-08 | standard_user |
| <a id="st-2"></a>ST-2 | [Cart] QTY label misaligns with quantity numbers in cart | Low | Low | CRT-08 | standard_user |
| <a id="st-3"></a>ST-3 | [Checkout] Cancel on Checkout: Overview returns to Inventory instead of Cart | Low | Low | CHK-08 | standard_user |
| <a id="st-4"></a>ST-4 | [Checkout] Order completes with an empty cart | High | High | CHK-09 | standard_user, error_user; all browsers |
| <a id="st-5"></a>ST-5 | [Checkout] Required fields accept spaces only | High | Medium | CHK-11 | standard_user |
| <a id="st-6"></a>ST-6 | [Checkout] Name fields accept numbers-only values | Medium | Low | CHK-12 | standard_user |
| <a id="st-7"></a>ST-7 | [Checkout] Name fields accept symbols-only values | Medium | Low | CHK-14 | standard_user |
| <a id="st-8"></a>ST-8 | [Checkout] Checkout fields have no maximum length | Low | Low | CHK-15 | standard_user |
| <a id="st-9"></a>ST-9 | [Checkout] Letters-only postal codes are allowed in Checkout: Your Information | Low | Medium | CHK-16 | standard_user |
| <a id="st-10"></a>ST-10 | [Menu] Reset App State button leaves product buttons showing "Remove" | Medium | Medium | MNU-03 | standard_user |
| <a id="st-11"></a>ST-11 | [Checkout] Back button reopens a $0.00 checkout | High | Medium | CHK-17 | standard_user |
| <a id="st-12"></a>ST-12 | [Checkout] Typing in Last Name overwrites First Name for problem_user, blocking checkout | Critical | High | CHK-01 | problem_user |
| <a id="st-13"></a>ST-13 | [Checkout] Finish returns "503 Service Unavailable" for error_user | Critical | High | CHK-01, CHK-09 | error_user |
| <a id="st-14"></a>ST-14 | [Checkout] Last Name accepts no input for error_user, and a blank Last Name still passes validation | High | Medium | CHK-01 | error_user |
| <a id="st-15"></a>ST-15 | [Cart] Remove on the Inventory page doesn't remove the item or update the badge | Medium | Medium | CRT-02 | problem_user, error_user |
| <a id="st-16"></a>ST-16 | [Product list] Inventory prices don't match product detail prices for visual_user | High | High | PLS-01 | visual_user |
| <a id="st-17"></a>ST-17 | [Product list] Every product shows the same dog image for problem_user | Medium | Medium | PLS-01 | problem_user |
| <a id="st-18"></a>ST-18 | [Product list] Sauce Labs Backpack shows the wrong image for visual_user | Medium | Low | PLS-01 | visual_user |

## Detailed write-ups
- [ST-4: Order completes with an empty cart](ST-4.md)
- [ST-12: Typing in Last Name overwrites First Name for problem_user, blocking checkout](ST-12.md)
- [ST-11: Back button reopens a $0.00 checkout](ST-11.md)
