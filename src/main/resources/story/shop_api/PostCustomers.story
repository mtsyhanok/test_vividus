Story: POST /cusomers/ test

Scenario: check response body
When I send HTTP POST to the relative URL '/customers/' with content: '{
  "firstname": "#{generate(Name.firstName)}",
  "lastname": "#{generate(Name.lastName)}"
}'
Then the response code is equal to '201'
When I save response body to the scenario variable 'body'
Then a JSON element from '${body}' by the JSON path '$' is equal to '{
  "firstname": "Freddy",
  "lastname": "Meyers",
  "customer_url": "/shop/customers/374"
}'
!-- ToDo: get customer_url from response and check GET request for the customer
!-- When I save a JSON element from response by JSON path '$.customer_url' to story variable 'customer_url'