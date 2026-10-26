# ST-4: [Checkout] Order completes with an empty cart

| Severity | Priority | Test case | Account | Environment |
| --- | --- | --- | --- | --- |
| High | High | CHK-09 | standard_user | Windows 11 · Chrome 155 · 1920×1080 |

## Preconditions
1. Logged in as standard_user
2. Cart empty
3. On Inventory page

## Steps to reproduce

1. Click the cart icon.
2. Click Checkout.
3. Enter Jane / Doe / 12345.
4. Click Continue.
5. Click Finish.

## Expected result
The user should not be able to start checkout with an empty cart. Checkout should be disabled or an error should say the cart is empty.

## Actual result
Checkout proceeds even when the cart is empty. The "Thank you for your order!" confirmation page appears for an order with no items.

## Evidence

![Screenshot description](../evidence/FILE-NAME.png)

## Impact
Empty orders can be created in the core purchase flow. This could reach order records and fulfillment.

## Suggested action
Disable Checkout when the cart is empty and show a message. Also reject an empty order when Finish is clicked, so the check can't be bypassed.
