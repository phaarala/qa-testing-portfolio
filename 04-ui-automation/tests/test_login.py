from playwright.sync_api import expect
from pages.login_page import LoginPage


def test_lgn_01_login_with_valid_standard_user(page, base_url):
    login = LoginPage(page)
    login.open()
    login.log_in("standard_user", "secret_sauce")
    expect(page).to_have_url(base_url + "/inventory.html")


def test_lgn_04_login_with_wrong_password(page):
    login = LoginPage(page)
    login.open()
    login.log_in("standard_user", "wrongpass")
    expect(login.error_message).to_have_text("Epic sadface: Username and password do not match any user in this service")
