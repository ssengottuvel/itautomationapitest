Feature: ReqRes API to be tested 

Background:
	* url 'https://reqres.in'
    * header Accept = 'application/json'

Scenario: Get a user
	Given path '/api/users/2'
	When method get
	Then status 200
	And match response.data.first_name == 'Janet'

Scenario: Post a user
	Given path '/api/users'
	And request { "name": "David", "job": "IT Consultant"}
	When method post
	Then status 201
	And def user = response
	And match $ contains {name: '#(user.name)', job: '#(user.job)'}