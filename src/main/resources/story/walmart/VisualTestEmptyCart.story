Description: Story to test empty cart view;

Scenario: Test page context view
Given I am on a page with the URL 'https://www.walmart.com/cart'
When I change context to an element by By.xpath(//div[@class='cart-lists-wrapper cart-use-new-ny-styling'])
When I ${visual-action} baseline with `empty_cart_context`


Scenario: Test the whole page view
When I change context to an element by By.xpath(//body)
When I ${visual-action} baseline with `empty_cart`