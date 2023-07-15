Feature: POST API demo
  Background:
    * url baseURL
    * header Accept = 'application/json'
    * def expectedOutput = read("response.json")

  Scenario: Post demo
    Given url 'https://reqres.in/api/users'
    And   request {"name": "morpheus","job": "leader"}
    When  method POST
    Then  status 201
    And   print response

  Scenario: Post demo with background
    Given path '/users'
    And   request {"name": "morpheus","job": "leader"}
    When  method POST
    Then  status 201
    And   print response

  Scenario: Post demo with background and assertions
    Given path '/users'
    And   request {"name": "morpheus","job": "leader"}
    When  method POST
    Then  status 201
    And   match response == {"name": "morpheus","job": "leader","id": "58","createdAt": "2023-07-15T19:50:03.810Z"}
    And   print response

  Scenario: Post demo with background and assertions and dollar
    Given path '/users'
    And   request {"name": "morpheus","job": "leader"}
    When  method POST
    Then  status 201
    And   match response == {"name": "morpheus","job": "leader","id": "#string","createdAt": "#ignore"}
    And   print response

  Scenario: Post demo with background and assertions and dollar and assertion with json file
    Given path '/users'
    And   request {"name": "morpheus","job": "leader"}
    When  method POST
    Then  status 201
    And   match response == expectedOutput
    And   print response

  Scenario: Post demo with background and assertions and dollar and assertion with json file and read request from file
    Given path '/users'
    And   def requestBody = read("requestForPost.json")
    And   request requestBody
    When  method POST
    Then  status 201
    And   match response == expectedOutput
    And   match $ == expectedOutput
    And   print response

  Scenario: Post demo with background and assertions and dollar and assertion with json file and read request from file with data from other folder
    Given path '/users'
    And   def projectPath = karate.properties['user.dir']
    And   print projectPath
    And   def filePath = projectPath+'src/test/data/requestForPost.json'
    And   print filePath
    And   def requestBody1 = projectPath
    And   request requestBody1
    When  method POST
    Then  status 201
    And   match response == expectedOutput
    And   match $ == expectedOutput
    And   print response