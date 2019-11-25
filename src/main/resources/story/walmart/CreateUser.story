Description: Story to test user creation;

Scenario: Open Walmart main page
Given I am on the main application page
Then the page title is 'Walmart.com | Save Money. Live Better.'


Scenario:  Create user
When I click on an element by the xpath '//button[@aria-label='Your Account']'
When I click on an element with the text 'Create Account'
When I enter '#{generate(Name.firstName)}' in a field with the name 'firstName'
When I enter '#{generate(Name.lastName)}' in a field with the name 'lastName'
When I enter '#{generate(Internet.emailAddress)}' in a field by the xpath '//input[@id='email-su']'
When I enter '#{generate(Internet.password)}' in a field by the xpath '//input[@id='password-su']'
When I click on an element with the text 'Create Account'
Then the page title is 'Account'
!-- ToDO: add CAPTCHA steps
