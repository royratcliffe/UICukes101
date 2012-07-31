Feature: Personal greeting
  In order to see my personal greeting
  As an Apple iOS user
  I want to enter my name and see a friendly hello

  Background:
    Given the front-most app has the name "UICukes101"

  Scenario: Says hello to Roy
    When the user enters his name "Roy"
    And presses the "Hello" button
    Then the greeter app says a friendly "Hello, Roy!"

