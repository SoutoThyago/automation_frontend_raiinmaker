@url_padrao
@smoke_testing
@balance

  Feature: Wallet Movement

    Scenario: Balance Validation
      Given the user is on the login page
      When the user enters credentials
      And the user submits the login form
      And the current balance is visible in Dashboard
      And the user click in Rewards Menu
      And the the Coiin Rewards Available is visible
      Then the current balance & Coiin Rewards Available are equals