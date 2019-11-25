Description: Story to test product search by Searchbox;

Scenario: Open Walmart main page
Given I am on the main application page
Then the page title is 'Walmart.com | Save Money. Live Better.'


Scenario: Search product by Searchbox
When I enter '<searchLine>' in a field by the xpath '//input[@placeholder='Search']'
When I change context to an element by the xpath '//input[@placeholder='Search']'
When I set focus to the context element
When I press ENTER on keyboard
When I change context to the page
Then the text 'Sorry, no products matched "<searchLine>"' does not exist
Then the number of elements found by the xpath '//div[@class='search-result-listview-item Grid']//child::*[contains(@title, '#{capitalize(<searchLine>)}') or contains(@title, '#{toLowerCase(<searchLine>)}')]' is less than or equal to '20'
Examples:
|searchLine|
|Playhouse |
|playhouse |