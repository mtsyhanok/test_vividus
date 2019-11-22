Description: Story to test product search by Searchbox;

Scenario: Open Walmart main page
Given I am on a page with the URL 'https://www.walmart.com/'
Then the page title is 'Walmart.com | Save Money. Live Better.'


Scenario: Search product by Searchbox
When I initialize the scenario variable `searchLine` with value `Playhouse`
When I enter '${searchLine}' in a field by the xpath '//input[@id='global-search-input']'
When I click on an element by the xpath '//button[@id='global-search-submit']'
!-- Check that at least one product found
Then the number of elements found by the xpath '//div[@class='search-result-listview-item Grid']//span[contains(., '${searchLine}')] | span[contains(., #{toLowerCase("${searchLine}")})]' is greater than '0'

!-- I try to read #of results found (in format " of 276 results") and store it '${numberOfResultsText}'
When I change context to an element by the xpath '//div[@class='result-summary-container']//span[@class='visuallyhidden']'
When I set the text found in search context to the scenario variable 'numberOfResultsText'
When I change context to the page
!-- Get digist from '${numberOfResultsText}' and store it to '${numberOfResults}'
When I initialize the scenario variable `numberOfResults` with value #{replaceFirstByRegExp(.(\d+)., $1,'${numberOfResultsText}')}

!-- ToDO: check that actual #of results found equal to '${numberOfResults}'