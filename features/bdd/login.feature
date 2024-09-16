#language:en
@after
@url_padrao
@execute_all

  Feature: User Registration and Login
@wip
    Scenario: Successful login with correct credentials
      Given the user is on the login page
      When the user enters correct credentials 'raiinmaker.qa@gmail.com' 'RaiinCoin$2024'
      And the user submits the login form
      Then an Loged message should be displayed
    
    Scenario: Unsuccessful login with incorrect credentials
      Given the user is on the login page
      When the user enters incorrect credentials
      And the user submits the login form
      Then an error message should be displayed
  
    Scenario: Successful user registration
      Given the user is on the registration page
      When the user enters valid credentials (email and password)
      And the user submits the registration form
      Then the user should be registered successfully
      And a confirmation email should be sent