# AuthManager Portfolio

AuthManager is a reusable authentication and licensing platform developed in modern C++.

The system is designed to support both desktop applications and web-based services, providing a common backend foundation for authentication, licensing, session management, and security-related functionality.

The project demonstrates production-oriented backend engineering practices including:

* Authentication
* Session management
* Email verification
* License activation
* Audit logging
* Security hardening
* Automated testing

## Technology Stack

### Backend

* C++20
* Crow
* MariaDB
* OpenSSL
* libsodium
* cURL

### Client Applications

* Qt
* QML

### Testing

* GoogleTest
* CMake

## Features

### Authentication

* User registration
* Secure password hashing
* Login validation
* Session creation and validation
* Logout functionality

### Email Verification

* Account verification workflow
* Login verification workflow
* Verification token generation
* Verification token expiration handling

### Session Management

* Secure session token generation
* Session validation
* Session persistence
* Session invalidation on logout

### Licensing

* License key activation
* Active license management
* License ownership tracking
* Prevention of license key reuse

### Security

* Password hashing
* Session token hashing
* Email verification tokens
* Login confirmation workflow
* IP-based login lockouts
* License activation lockouts
* Audit logging

## Automated Testing

Current automated test coverage includes:

* Password verification tests
* User registration tests
* Authentication tests
* Session tests
* Email verification tests
* License activation tests
* Audit log tests
* Route validation tests

### Current Status

* 32 automated tests
* 8 test suites
* All tests passing

## Architecture

The production backend source code is intentionally kept private because the project may be used in future commercial software products.

This repository serves as a portfolio showcase containing:

* Architecture documentation
* Authentication flow documentation
* Database documentation
* Development logs
* Test results
* Screenshots
* Demonstration videos

## Project Goal

Design and implement a reusable authentication and licensing platform suitable for desktop applications, websites, SaaS products, and future commercial software projects.
