Description: Story to test user creation;

Scenario: Open Walmart main page
Given I am on a page with the URL 'https://www.walmart.com/'
Then the page title is 'Walmart.com | Save Money. Live Better.'

Scenario:  Create user
When I click on an element by the xpath '//button[@aria-label='Your Account']'
When I click on an element by the xpath  '//div[contains(text(),'Create Account')]' 
When I enter '#{generate(Name.firstName)}' in a field by the xpath '//input[@id='first-name-su']'
When I enter '#{generate(Name.lastName)}' in a field by the xpath '//input[@id='last-name-su']'
When I enter '#{generate(Internet.emailAddress)}' in a field by the xpath '//input[@id='email-su']'
When I enter '#{generate(Internet.password)}' in a field by the xpath '//input[@id='password-su']'
When I click on an element by the xpath '//button[@data-tl-id='signup-submit-btn']'
Then the page title is 'Account'
!-- ToDO: add CAPTCHA steps