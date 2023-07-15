Feature: Delete scenarios

  Scenario: Delete data
    Given   url 'https://reqres.in/api/users/2'
    And     request {"name": "morpheus","job": "zion resident"}
    When    method DELETE
    Then    status 204
    And     print response