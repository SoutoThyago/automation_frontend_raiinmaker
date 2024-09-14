
# Automated Test Scenarios for Raiinmaker Platform

This project contains automated test scenarios focused on the Raiinmaker platform's core functionalities, including user registration, AI content contribution, transaction rewards, and cryptocurrency wallet integration.

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

- **BDD Framework**: Cucumber or SpecFlow (Choose based on your stack)
- **Test Automation**: Selenium, Cypress, or Playwright
- **Languages**: JavaScript, Java, or Python
- **CI/CD Integration**: GitHub Actions or Jenkins

---

## How to Run the Tests

1. Clone the repository:
   ```bash
   git clone https://github.com/SoutoThyago/automation_frontend_raiinmaker.git
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Run the tests:
   ```bash
   npm run test
   ```

4. View test results in the terminal or test report.

---

## Contribution

Feel free to fork this repository, create a new branch, and submit a pull request for any bug fixes or new test scenarios. All contributions are welcome!

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.