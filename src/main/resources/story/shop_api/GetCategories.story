Story: GET /categories/ test

Scenario: check GET /categories/ response
When I send HTTP GET to the relative URL 'categories/'
Then the response code is equal to '200'
Then a JSON element by the JSON path '$' is equal to '<expectedOutput>'
Examples:
|expectedOutput												 |
|#{loadResource(/story/shop_api/expectedOutputGetCategories.txt)}|


