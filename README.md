# AuthManager Portfolio

AuthManager is a backend authentication and licensing system developed in modern C++.

The project demonstrates production-oriented backend engineering practices including:

* Authentication
* Session management
* Email verification
* License activation
* Audit logging
* Security hardening
* Automated testing

## Technology Stack

* C++20
* Crow
* MariaDB
* OpenSSL
* libsodium
* cURL
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

* Email verification workflow
* Login verification workflow
* Verification token generation
* Token expiration handling

### Licensing

* License key activation
* Active license management
* License ownership tracking
* Prevention of license key reuse

### Security

* Password hashing
* Session token hashing
* IP-based login lockouts
* License activation lockouts
* Audit logging

## Automated Testing

Current test coverage includes:

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

The production backend source code is intentionally kept private because the project may be used in future commercial software.

This repository serves as a portfolio showcase containing:

* Documentation
* Architecture diagrams
* Development logs
* Test results
* Design decisions

## Project Goal

Create a reusable authentication and licensing backend suitable for desktop applications and future commercial software products.
