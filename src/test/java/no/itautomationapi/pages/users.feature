
Feature: sample karate test script
 
Background:
* url 'https://jsonplaceholder.typicode.com'
 
Scenario: get all users and then get the first user by id
 
Given path 'users'
When method get
Then status 200
 
* def first = response[0]
 
Given path 'users', first.id
When method get
Then status 200