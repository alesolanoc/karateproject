Feature: Sample API Tests

  Background:
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Test a Sample Get API
    Given url 'https://reqres.in/api/users?page=2'
    When  method GET
    Then  status 200
    And   print response
    And   print responseStatus
    And   print responseTime
    And   print responseHeaders
    And   print responseCookies

  Scenario: Test a Sample Get API with background
    Given path '/users?page=2'
    When  method GET
    Then  status 200
    And   print response

  Scenario: Test a Sample Get API with background and parameter
    Given path '/users'
    And   param page = 2
    When  method GET
    Then  status 200
    And   print response

  Scenario: Test a Sample Get API with background and 3 assertions
    Given path '/users'
    And   param page = 2
    When  method GET
    Then  status 200
    And   print response
    And   match response.data[0].first_name != null
    And   assert response.data.length == 6
    And   match response.data[3].id == 10

  Scenario: Test a Sample Get API with background and 4 assertions
    Given path '/users'
    And   param page = 2
    When  method GET
    Then  status 200
    And   print response
    And   match response.data[0].first_name != null
    And   assert response.data.length == 6
    And   match $.data[3].id == 10
    And   match $.data[4].last_name == 'Edwards'