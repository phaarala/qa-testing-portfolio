from playwright.sync_api import expect
from pages.inventory_page import InventoryPage

NUM_ITEMS = 6


def test_pls_01_inventory_shows_six_complete_products(logged_in_page):
    inventory = InventoryPage(logged_in_page)
    expect(inventory.items).to_have_count(NUM_ITEMS)
    for i in range(NUM_ITEMS):
        item = inventory.items.nth(i)
        expect(item.locator('[data-test="inventory-item-name"]')).to_be_visible()
        expect(item.locator("img")).to_be_visible()
        expect(item.locator('[data-test="inventory-item-price"]')).to_be_visible()
        expect(item.locator('[data-test="inventory-item-desc"]')).to_be_visible()
        expect(item.locator("button")).to_have_text("Add to cart")
