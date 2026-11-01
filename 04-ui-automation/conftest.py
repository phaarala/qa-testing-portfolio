import pytest
from pages.login_page import LoginPage


@pytest.fixture
def logged_in_page(page):
    """Precondition shared by most tests: logged in as standard_user, on the Inventory page."""
    login = LoginPage(page)
    login.open()
    login.log_in("standard_user", "secret_sauce")
    return page
