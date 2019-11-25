Description: Story to test adding product to the cart;

Scenario:  Search for product
Given I am on the main application page
When I enter 'humidifier' in a field by the xpath '//input[@placeholder='Search']'
When I click on an element by the xpath '//button[@id='global-search-submit']'
When I set 'title' attribute value of the element by By.xpath((//span[contains(text(),'Product Title')]/following-sibling::a)[2]) to the story variable 'productTitle'


Scenario: Open product's page
When I click on an element by the xpath '(//span[contains(text(),'Product Title')]/following-sibling::a)[2]'
Then the page title contains the text '${productTitle}'
Then an element with the tag 'h1' and text '${productTitle}' exists


Scenario: Add product to the cart
When I click on an element with the text 'Add to Cart'
Then the page title is equal to 'Item added to cart - Walmart.com'
Then the text 'You just added 1 item' exists
Then an element by the xpath '//div[@*='header-cart-tooltip' and text()=1]' exists


Scenario: Open cart and check it
!-- ToDo