class CheckoutPage:
    def __init__(self, page):
        self.page = page

        # Checkout: Your information
        self.first_name_input = page.locator('[data-test="firstName"]')
        self.last_name_input = page.locator('[data-test="lastName"]')
        self.postal_code_input = page.locator('[data-test="postalCode"]')
        self.continue_button = page.locator('[data-test="continue"]')

        # Checkout: Overview
        self.item_total = page.locator('[data-test="subtotal-label"]')
        self.tax = page.locator('[data-test="tax-label"]')
        self.total = page.locator('[data-test="total-label"]')
        self.finish_button = page.locator('[data-test="finish"]')

        # Checkout: Complete
        self.complete_header = page.locator('[data-test="complete-header"]')

    def enter_details(self, first_name, last_name, postal_code):
        self.first_name_input.fill(first_name)
        self.last_name_input.fill(last_name)
        self.postal_code_input.fill(postal_code)
        self.continue_button.click()

    def finish(self):
        self.finish_button.click()
