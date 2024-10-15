#language:en
@after
@url_padrao
@smoke_testing
@login

  Feature: User Registration and Login

    Scenario: Successful login with correct credentials
      Given the user is on the login page
      When the user enters credentials 
      And the user submits the login form
      Then an Loged message should be displayed

    Scenario: Unsuccessful login with incorrect credentials
      Given the user is on the login page
      When the user enters wrong credentials 
      And the user submits the login form
      Then an error message should be displayed