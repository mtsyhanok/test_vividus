Description: Story to test adding product to the cart;

Scenario:  Search for product
Given I am on a page with the URL 'https://www.walmart.com/'
When I enter 'humidifier' in a field by the xpath '//input[@id='global-search-input']'
When I click on an element by the xpath '//button[@id='global-search-submit']'
!-- Set product's title to '${productTitle}'
When I set 'title' attribute value of the element by By.xpath(//div[@class='search-product-result']//ul//li[2]//div[@class='search-result-product-title gridview']/a) to the story variable 'productTitle'


Scenario: Open product's page
When I click on an element by the xpath '//div[@class='search-product-result']//ul//li[2]//div[@class='search-result-product-title gridview']'
Then the page title contains the text '${productTitle}'
Then an element with the tag 'h1' and text '${productTitle}' exists


Scenario: Add product to the cart
When I click on an element by the xpath '//button/*[contains(., 'Add to Cart')]'
Then the page title is equal to 'Item added to cart - Walmart.com'
Then the text 'You just added 1 item' exists


Scenario: Open cart and check it
!-- ToDo