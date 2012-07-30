Feature: Personal greeting
  In order to see my personal greeting
  As an Apple iOS user
  I want to enter my name and see a friendly hello

  Scenario: Says hello to Roy
    Given that the user launches the personal greeter app
    When the user enters his name "Roy"
    And presses the "Hello" button
    Then the greeter app says a friendly "Hello, Roy!"

