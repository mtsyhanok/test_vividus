Story: POST /cusomers/ test

Scenario: POST /customers/ with valid data
When I send HTTP POST to the relative URL 'customers/' with content: '{
  "firstname": "<firstName>",
  "lastname": "<lastName>"
}'
Then the response code is equal to '201'
Then a JSON element by the JSON path '$.firstname' is equal to '<firstName>'
Then a JSON element by the JSON path '$.lastname' is equal to '<lastName>'
When I save a JSON element from response by JSON path '$.customer_url' to scenario variable 'customerURL'
Then `${customerURL}` matches `<customer_url>`
Examples:
|firstName					|lastName				   |customer_url	      |
|#{generate(Name.firstName)}|#{generate(Name.lastName)}|\"/shop/customers/\d+"|


Scenario: POST /cutomers/ with not unique name
When I send HTTP POST to the relative URL 'customers/' with content: '{
  "firstname": "<firstName>",
  "lastname": "<lastName>"
}'
Then the response code is equal to '201'
When I send HTTP POST to the relative URL 'customers/' with content: '{
  "firstname": "<firstName>",
  "lastname": "<lastName>"
}'
Then the response code is equal to '409'
Then a JSON element by the JSON path '$.error' is equal to 'Bad Request'
Then a JSON element by the JSON path '$.validation.keys' is equal to '<validationKeys>'
Examples:
|firstName					|lastName				   |validationKeys		   |
|#{generate(Name.firstName)}|#{generate(Name.lastName)}|["firstname, lastname"]|


Scenario: POST /cutomers/ without body
When I send HTTP POST to the relative URL 'customers/' with content: '{}'
Then the response code is equal to '400'
Then a JSON element by the JSON path '$.error' is equal to 'Bad Request'
Then a JSON element by the JSON path '$.validation.keys' is equal to '["firstname"]'


Scenario: Post /customers/ with invalid data
When I send HTTP POST to the relative URL 'customers/' with content: '{
  "firstname": <firstName>,
  "lastname": <lastName>
}'
Then the response code is equal to '400'
Then a JSON element by the JSON path '$.error' is equal to 'Bad Request'
Then a JSON element by the JSON path '$.validation.keys' is equal to '<validationKeys>'
Examples:
|firstName						|lastName				   	 |validationKeys	|
|"#{generate(Name.firstName)}"	|""						   	 |["lastname"] 		|
|""								|""						     |["firstname"] 	|
|""								|"#{generate(Name.lastName)}"|["firstname"] 	|