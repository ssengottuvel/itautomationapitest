Feature: Recipe Puppy
 
Background:
* url 'http://www.recipepuppy.com'
 
Scenario Outline: Get a recipe for <ingredient>
 
Given path 'api'
And params {i: '<ingredient>'}
When method get
Then status 200
And match response contains {results: '#array'}
And match response.results[*] contains
  """
  {
    title: '#string',
    href: '#string',
    ingredients: '#regex <ingredient>',
    thumbnail: '#string'
  }
  """
 
  Examples:
    | ingredient |
    | tomato     |
    | pepperoni  |
    | cheese     |