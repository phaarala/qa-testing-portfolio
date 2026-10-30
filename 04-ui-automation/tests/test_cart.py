from playwright.sync_api import expect
from pages.inventory_page import InventoryPage

TEST_PRODUCT_1 = "sauce-labs-backpack"
TEST_PRODUCT_2 = "sauce-labs-bike-light"


def test_crt_01_add_item_to_cart(logged_in_page):
    inventory = InventoryPage(logged_in_page)
    inventory.add_to_cart(TEST_PRODUCT_1)

    expect(inventory.remove_button(TEST_PRODUCT_1)).to_be_visible()
    expect(inventory.cart_badge).to_have_text("1")


def test_crt_02_remove_item_from_inventory_page(logged_in_page):
    inventory = InventoryPage(logged_in_page)
    inventory.add_to_cart(TEST_PRODUCT_1)
    inventory.add_to_cart(TEST_PRODUCT_2)
    expect(inventory.cart_badge).to_have_text("2")

    inventory.remove_from_cart(TEST_PRODUCT_1)
    expect(inventory.add_button(TEST_PRODUCT_1)).to_be_visible()
    expect(inventory.cart_badge).to_have_text("1")
