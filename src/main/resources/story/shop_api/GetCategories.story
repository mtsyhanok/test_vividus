Story: GET /categories/ test

Scenario: check response body
When I issue a HTTP GET request for a resource with the URL 'https://api.predic8.de/shop/categories/'
Then the response code is equal to '200'
When I save response body to the scenario variable 'body'
Then a JSON element from '${body}' by the JSON path '$' is equal to '{
"categories": [
{
"name": "Fruits",
"category_url": "/shop/categories/Fruits"
},
{
"name": "Dried",
"category_url": "/shop/categories/Dried"
},
{
"name": "Fresh",
"category_url": "/shop/categories/Fresh"
},
{
"name": "Exotic",
"category_url": "/shop/categories/Exotic"
},
{
"name": "Nuts",
"category_url": "/shop/categories/Nuts"
}
]
}' IGNORING_ARRAY_ORDER