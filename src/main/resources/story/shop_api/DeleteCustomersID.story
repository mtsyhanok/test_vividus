Story: DELETE /customers/{id} test

Scenario: DELETE existent customer
When I send HTTP POST to the relative URL 'customers/' with content: '{
  "firstname": "<firstName>",
  "lastname": "<lastName>"
}'
When I save a JSON element from response by JSON path '$.customer_url' to scenario variable 'customerURL'
When I send HTTP DELETE to the relative URL 'customers/<customerID>'
Then the response code is equal to '200'
Then the response body is equal to ''
Examples:
|firstName					|lastName				   |customerID	      												  								 |
|#{generate(Name.firstName)}|#{generate(Name.lastName)}|#{removeWrappingDoubleQuotes(#{replaceFirstByRegExp(/shop/customers/(\d+), $1, ${customerURL})})}|


Scenario: DELETE nonexistent customer
When I send HTTP POST to the relative URL 'customers/' with content: '{
  "firstname": "<firstName>",
  "lastname": "<lastName>"
}'
When I save a JSON element from response by JSON path '$.customer_url' to scenario variable 'customerURL'
When I send HTTP DELETE to the relative URL 'customers/<customerID>'
Then the response code is equal to '200'
When I send HTTP DELETE to the relative URL 'customers/<customerID>'
Then the response code is equal to '404'
Then a JSON element by the JSON path '$.error' is equal to 'Not Found'
Examples:
|firstName					|lastName				   |customerID	      												  								 |
|#{generate(Name.firstName)}|#{generate(Name.lastName)}|#{removeWrappingDoubleQuotes(#{replaceFirstByRegExp(/shop/customers/(\d+), $1, ${customerURL})})}|


Scenario: DELETE customer with incorrect id
When I send HTTP DELETE to the relative URL 'customers/<customerID>'
Then the response code is equal to '400'
Then a JSON element by the JSON path '$.error' is equal to 'Bad Request'
Then a JSON element by the JSON path '$.validation.keys' is equal to '["id"]'
Examples:
|customerID							|
|#{generate(regexify '[a-z]{5}')}	|
|#{generate(Commerce.price)}		|
|#{generate(Crypto.md5)}			|
|#{randomInt(-125, -1)}				|
