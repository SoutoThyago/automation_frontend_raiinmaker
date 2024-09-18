# Automated Test Scenarios for Raiinmaker Platform

This project contains automated test scenarios focused on the Raiinmaker platform's core functionalities, including user registration, AI content contribution, transaction rewards, and cryptocurrency wallet integration.

The project is implemented using Ruby and follows the Behavior Driven Development (BDD) approach using Cucumber and Gherkin for writing test scenarios. Selenium and Capybara are used for browser automation, while Allure is used for generating detailed test reports.

## Table of Contents
- [Project Overview](#project-overview)
- [Test Features](#test-features)
  - [User Registration & Login](#user-registration--login)
  - [AI Content Contribution & Validation](#ai-content-contribution--validation)
  - [Transaction & Rewards System](#transaction--rewards-system)
  - [Cryptocurrency Wallet Integration](#cryptocurrency-wallet-integration)
- [Test Frameworks & Tools](#test-frameworks--tools)
- [How to Run the Tests](#how-to-run-the-tests)
- [Contribution](#contribution)
- [License](#license)

---

## Project Overview

This project focuses on automating critical test cases for the Raiinmaker platform, a cryptocurrency-based service that allows users to contribute, validate AI models, and receive rewards. These scenarios are written in BDD (Behavior Driven Development) format using Gherkin, which allows easy readability and shared understanding between developers and stakeholders.

The project uses Ruby as the programming language and integrates various popular testing tools.

## Test Features

### 1. User Registration & Login

These scenarios ensure that users can successfully register and login to the platform with valid credentials, as well as handle unsuccessful login attempts.

#### Scenarios
- **Successful User Registration**: Ensures users can register with valid credentials and receive confirmation emails.
- **Unsuccessful Login**: Handles incorrect credentials and ensures appropriate error messages are shown.

### 2. AI Content Contribution & Validation

Raiinmaker allows users to contribute AI-generated content and validate AI models. This feature ensures content submission and validation workflows operate correctly.

#### Scenarios
- **Contribute AI Content**: Validates the submission of valid AI content and rewards users with $COIIN tokens.
- **Validate AI Models**: Verifies that users can validate AI models and earn rewards.

### 3. Transaction & Rewards System

Users on Raiinmaker are rewarded in cryptocurrency ($COIIN) for their contributions. This section tests reward tracking and transaction history accuracy.

#### Scenarios
- **Track Reward Earnings**: Ensures that user rewards are updated and displayed correctly after content contribution or validation.
- **View Transaction History**: Verifies that users can view their transaction history and that the details are accurate.

### 4. Cryptocurrency Wallet Integration

Users can integrate cryptocurrency wallets to enable transactions. This feature tests successful wallet connection.

#### Scenarios
- **Connect Cryptocurrency Wallet**: Tests wallet integration, ensuring users can connect a valid crypto wallet to their account and enable transactions.

---

## Test Frameworks & Tools

The following tools and frameworks are used in this project:

- **Language**: Ruby
- **BDD Framework**: Cucumber with Gherkin syntax for writing test scenarios
- **Browser Automation**: Selenium WebDriver and Capybara for simulating user interactions with the web application
- **Reporting**: Allure for generating detailed and visual test reports
- **CI/CD Integration**: GitHub Actions or Jenkins for continuous integration

---

## How to Run the Tests

1. Clone the repository:
   ```bash
   git clone https://github.com/SoutoThyago/automation_frontend_raiinmaker

2. Execute Bundle command:
   ```bash
   bundle install
   
3. Get Cucumber Gem:
   ```bash
   bundle gem cucumber

4. Get allure report Gem:
   ```bash
   bundle gem allure serve