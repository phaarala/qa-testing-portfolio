# Defect Reports

9 defects logged in Jira (space **RB**) while testing the Restful-Booker API. Each one was found by a test in the `4 Known defects` folder of the Postman collection; the test name includes its Jira key.

| Key | Summary | Severity | Priority | Test | Endpoint |
| --- | --- | --- | --- | --- | --- |
| RB-1 | [Auth] Wrong password returns 200 instead of 401 | Medium | Medium | API-16 | `POST /auth` |
| RB-2 | [Booking] Missing required field returns 500 instead of 400 | Medium | Medium | API-17 | `POST /booking` |
| RB-3 | [Booking] Text totalprice is accepted and saved as null | High | High | API-18 | `POST /booking` |
| RB-4 | [Booking] Checkout date before check-in is accepted | High | High | API-19 | `POST /booking` |
| RB-5 | [Booking] Spaces-only firstname is accepted and saved empty | Medium | Medium | API-20 | `POST /booking` |
| RB-6 | [Booking] Decimal totalprice is cut to a whole number | High | High | API-21 | `POST /booking` |
| RB-7 | [Booking] PUT on a missing booking returns 405 instead of 404 | Low | Low | API-22 | `PUT /booking/{id}` |
| RB-8 | [Booking] DELETE on a missing booking returns 405 instead of 404 | Low | Low | API-23 | `DELETE /booking/{id}` |
| RB-9 | [Search] Check-in filter leaves out bookings on the filter date | Medium | Medium | API-24 | `GET /booking` |

RB-3, RB-4 and RB-6 are rated High because they save incorrect data with no error to the client. RB-7 and RB-8 are Low because the request is still refused; only the status code is wrong.
