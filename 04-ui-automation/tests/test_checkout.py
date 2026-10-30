import pytest
from playwright.sync_api import expect
from pages.inventory_page import InventoryPage
from pages.cart_page import CartPage
from pages.checkout_page import CheckoutPage

TEST_PRODUCT_1 = "sauce-labs-backpack"
TEST_PRODUCT_2 = "sauce-labs-bike-light"

TEST_ITEM_TOTAL = "Item total: $39.98"
TEST_TAX = "Tax: $3.20"
TEST_TOTAL = "Total: $43.18"

VALID_FIRSTNAME = "Jane"
VALID_LASTNAME = "Doe"
VALID_ZIPCODE = "12345"


def test_chk_01_checkout_happy_path(logged_in_page):
    inventory = InventoryPage(logged_in_page)
    cart = CartPage(logged_in_page)
    checkout = CheckoutPage(logged_in_page)
    # Add item to cart and continue to checkout
    inventory.add_to_cart(TEST_PRODUCT_1)
    inventory.open_cart()
    cart.checkout()
    # Checkout flow (enter first, last, zipcode and finish)
    checkout.enter_details(VALID_FIRSTNAME, VALID_LASTNAME, VALID_ZIPCODE)
    checkout.finish()

    expect(checkout.complete_header).to_have_text("Thank you for your order!")
    expect(inventory.cart_badge).to_have_count(0)


def test_chk_06_item_total_is_sum_of_prices(logged_in_page):
    inventory = InventoryPage(logged_in_page)
    cart = CartPage(logged_in_page)
    checkout = CheckoutPage(logged_in_page)
    # Add item to cart and continue to checkout
    inventory.add_to_cart(TEST_PRODUCT_1)
    inventory.add_to_cart(TEST_PRODUCT_2)
    inventory.open_cart()
    cart.checkout()
    # Checkout (enter first, last and zipcode)
    checkout.enter_details(VALID_FIRSTNAME, VALID_LASTNAME, VALID_ZIPCODE)
    expect(checkout.item_total).to_have_text(TEST_ITEM_TOTAL)


def test_chk_07_total_includes_tax(logged_in_page):
    inventory = InventoryPage(logged_in_page)
    cart = CartPage(logged_in_page)
    checkout = CheckoutPage(logged_in_page)
    # Add item to cart and continue to checkout
    inventory.add_to_cart(TEST_PRODUCT_1)
    inventory.add_to_cart(TEST_PRODUCT_2)
    inventory.open_cart()
    cart.checkout()
    # Checkout (enter first, last and zipcode)
    checkout.enter_details(VALID_FIRSTNAME, VALID_LASTNAME, VALID_ZIPCODE)

    expect(checkout.tax).to_have_text(TEST_TAX)
    expect(checkout.total).to_have_text(TEST_TOTAL)


@pytest.mark.xfail(reason="Known defect ST-4: an order completes with an empty cart", strict=True)
def test_chk_09_checkout_with_empty_cart_is_rejected(logged_in_page, base_url):
    inventory = InventoryPage(logged_in_page)
    cart = CartPage(logged_in_page)
    checkout = CheckoutPage(logged_in_page)
    inventory.open_cart()
    cart.checkout()
    checkout.enter_details(VALID_FIRSTNAME, VALID_LASTNAME, VALID_ZIPCODE)
    checkout.finish()
    expect(logged_in_page).not_to_have_url(base_url + "/checkout-complete.html")
