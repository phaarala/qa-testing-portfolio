class InventoryPage:
    def __init__(self, page):
        self.page = page
        self.items = page.locator('[data-test="inventory-item"]')
        self.cart_badge = page.locator('[data-test="shopping-cart-badge"]')
        self.cart_link = page.locator('[data-test="shopping-cart-link"]')
        self.menu_button = page.locator("#react-burger-menu-btn")
        self.logout_link = page.locator('[data-test="logout-sidebar-link"]')

    def add_button(self, product):
        return self.page.locator(f'[data-test="add-to-cart-{product}"]')

    def remove_button(self, product):
        return self.page.locator(f'[data-test="remove-{product}"]')

    def add_to_cart(self, product):
        self.add_button(product).click()

    def remove_from_cart(self, product):
        self.remove_button(product).click()

    def open_cart(self):
        self.cart_link.click()

    def log_out(self):
        self.menu_button.click()
        self.logout_link.click()
