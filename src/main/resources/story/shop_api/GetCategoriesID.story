Story: GET /categories/{id} test

Scenario: check response body
When I issue a HTTP GET request for a resource with the URL 'https://api.predic8.de/shop/categories/<category_id>'
Then the response code is equal to '200'
When I save response body to the scenario variable 'body'
Then a JSON element from '${body}' by the JSON path '$' is equal to <expected response>
Examples:
|category_id|expected_response|
|Exotic|{
"name": "Exotic",
"products": [
{
"name": "Dragon Fruit",
"product_url": "/shop/products/2"
},
{
"name": "Figs",
"product_url": "/shop/products/8"
},
{
"name": "Horn Cucumber",
"product_url": "/shop/products/13"
},
{
"name": "Kaki",
"product_url": "/shop/products/14"
},
{
"name": "Lychee",
"product_url": "/shop/products/15"
},
{
"name": "Rambutan",
"product_url": "/shop/products/44"
}
]
}|
|exotic| {
"name": "Exotic",
"products": [
{
"name": "Dragon Fruit",
"product_url": "/shop/products/2"
},
{
"name": "Figs",
"product_url": "/shop/products/8"
},
{
"name": "Horn Cucumber",
"product_url": "/shop/products/13"
},
{
"name": "Kaki",
"product_url": "/shop/products/14"
},
{
"name": "Lychee",
"product_url": "/shop/products/15"
},
{
"name": "Rambutan",
"product_url": "/shop/products/44"
}
]
}|


Scenario: check response for nonexistent category
When I issue a HTTP GET request for a resource with the URL 'https://api.predic8.de/shop/categories/fish'
Then the response code is equal to '200'
When I save response body to the scenario variable 'body'
Then a JSON element from '${body}' by the JSON path '$' is equal to '{
"name": "fish",
"products": []
}'