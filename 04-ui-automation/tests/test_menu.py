from playwright.sync_api import expect
from pages.login_page import LoginPage
from pages.inventory_page import InventoryPage


def test_mnu_01_logout_from_side_menu(logged_in_page, base_url):
    inventory = InventoryPage(logged_in_page)
    login = LoginPage(logged_in_page)
    inventory.log_out()
    expect(logged_in_page).to_have_url(base_url + "/")
    expect(login.login_button).to_be_visible()


def test_mnu_02_back_button_after_logout(logged_in_page):
    inventory = InventoryPage(logged_in_page)
    login = LoginPage(logged_in_page)
    inventory.log_out()
    logged_in_page.go_back()
    expect(login.error_message).to_have_text(
        "Epic sadface: You can only access '/inventory.html' when you are logged in."
    )
