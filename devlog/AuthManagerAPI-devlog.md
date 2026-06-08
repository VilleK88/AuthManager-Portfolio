# Devlog

## 2026-05-22

### Qt / GUI
- Learned Qt framework basics and Qt Creator workflow.
- Built a Qt Widgets based GUI for the AuthManager project.
- Added QStackedWidget structure with:
  - login page
  - register page
  - dashboard page
- Solved multiple widget hierarchy and layout related issues.
- Added hidden password input fields.

### CMake / Project Structure
- Refactored the project structure into a shared `auth_core` backend library.
- Added separate `src/CMakeLists.txt`.
- Connected the Qt GUI to the same backend used by the terminal application.
- Fixed build directory and CMake cache related problems.

### Git
- Updated `.gitignore` for Qt/CMake projects.
- Prevented build folders, `_deps`, and autogen files from being committed.
- Added GitHub updates related to UI development progress.

### Authentication
- Removed license key requirement from the normal login flow.
- Improved separation between:
  - login logic
  - registration logic
  - future license management
- Added email field support and planned email validation improvements.

### Notes
- Qt Widgets + Designer currently feels much more cumbersome than Unity UI workflow.
- QML appears to be a more modern and component-based approach for future Qt projects.
- Markdown devlogs stored in Git repositories seem like a better long-term solution than random txt notes.

## 2026-05-22
- Refactored AuthManager into shared auth_core backend library.

## 2026-05-22
- Implemented QStackedWidget navigation between login and register pages.

## 2026-05-22
- Fixed Qt layout and widget hierarchy issues.

## 2026-05-25
- 2026-05-25 - Qt Quick/QML migration and security improvements

- Improved session security by hashing session tokens before storing them in the database.
- Added hashing for license keys before validation and database storage.
- Refactored session validation and license activation logic.
- Reduced unnecessary database queries during license activation.

- Converted the GUI project from Qt Widgets Application to a Qt Quick/QML based application.
- Rebuilt the UI architecture using QML components and StackView navigation.
- Created reusable UI components such as AppButton, AppTextField, and TopMenuBar.
- Added reactive UI behavior using QML properties and bindings.

- Built an AuthBridge layer between the QML frontend and the C++ backend.
- Connected login/logout functionality from QML to the backend authentication system.
- Added dashboard session and username handling.


## 2026-05-26
## Devlog – 2026-05-26

### Major Backend & Database Refactor

Today much of the authentication and license system architecture was redesigned and rewritten.

The previous license system was replaced with a more production-like structure:

* `products`
* `license_keys`
* `licenses`

The new flow now works as follows:

1. Product-specific activation keys are generated separately
2. Only hashed license keys are stored in the database
3. Users activate licenses using raw activation keys
4. Activated licenses become tied to the authenticated user account
5. License ownership, expiration and activation states are now handled through dedicated tables

The `Database` class was heavily refactored to support the new architecture and transaction-based license activation logic was implemented using MariaDB transactions (`commit` / `rollback`).

### Security Improvements

Additional security improvements were implemented:

* Session tokens are hashed before database storage
* License keys are hashed before database storage
* Raw activation keys are never stored permanently
* Activation keys can only be used once
* Session validation is now required during activation
* License activation logic now uses transactional database operations

A separate internal `LicenseKeyGenerator` tool was also created for securely generating and inserting hashed activation keys into the database without exposing generation logic inside the main application.

### Qt Quick / QML UI Development

The application UI development continued fully in Qt Quick/QML.

New pages and UI systems added:

* Dashboard page
* License activation page
* Active licenses page
* Reusable `TopMenuBar` component
* Improved StackView navigation flow
* Proper logout navigation handling
* Dynamic license list rendering using `ListView`

The new UI architecture already feels significantly cleaner and more scalable compared to the earlier Qt Widgets implementation.


## 2026-06-02
Added backend login lockout logic.

- Added shared ValidationResult structure for backend validation responses
- Extended login result handling with token and message fields
- Added failed login tracking fields to users table
- Added failed login attempt counting in Database
- Added account lockout after repeated failed login attempts
- Added 15-minute lockout after 3 failed password attempts within 15 minutes
- Added failed login reset after successful authentication
- Updated login route to return backend validation messages to the frontend

## 2026-06-02
Enabled HTTPS support for AuthManager API communication.

- Added local self-signed TLS certificate for development
- Enabled SSL support in Crow backend
- Migrated API server from HTTP to HTTPS
- Updated Qt client API base URL to use HTTPS
- Added local development SSL error handling for self-signed certificates
- Added automatic certificate copying to backend build output

## 2026-06-02
Added foundation for email verification support.

- Extended Config system to support application-level configuration
- Added app_config.json for email and application settings
- Added email verification configuration options
- Added email verification database fields
- Added email verification token generation
- Added email verification token validation
- Added email verification status checks
- Refactored hashing logic into reusable hash_string() helper
- Refactored SQL exception handling into reusable log_sql_error() helper
- Improved Database code reuse and reduced duplicate hashing logic

## 2026-06-03
Implemented complete email verification flow.

- Added email verification token generation during account creation
- Added email verification token persistence in database
- Added email verification status tracking for user accounts
- Added email verification token validation endpoint
- Added login restrictions for unverified accounts
- Added AWS SES SMTP integration for verification email delivery
- Added configurable SMTP sender address support
- Added verification email link generation
- Added email verification configuration options
- Successfully tested end-to-end verification workflow through AWS SES

Improved authentication security.

- Added failed login attempt tracking
- Added automatic account lockout after repeated failed login attempts
- Added lockout expiration handling
- Added failed login counter reset after successful authentication
- Improved backend authentication validation flow

Improved session management.

- Added persistent local session storage using QSettings
- Added automatic session restoration during application startup
- Added backend session validation endpoint
- Added automatic session cleanup during logout
- Reduced unnecessary login requests for returning users

Improved transport security.

- Added HTTPS communication between frontend and backend
- Added SSL support for Crow backend
- Added support for self-signed development certificates
- Updated API communication to use secure connections

## 2026-06-03
Implemented IP-based brute force protection.

- Added ip_login_attempts database table
- Added IP login attempt tracking
- Added IP lockout validation
- Added automatic IP lockout after repeated failed login attempts
- Added IP lockout expiration handling
- Added failed IP login counter reset after successful authentication
- Added IP lockout checks to login route
- Added separate protection layer alongside existing account-based lockout

## 2026-06-03
Added license activation brute force protection.

- Added IP-based license activation attempt tracking
- Added temporary IP lockout for repeated failed license activation attempts
- Added license activation lockout validation to the activation route
- Added failed license activation recording
- Added failed license activation cleanup after successful activation
- Kept license activation security separate from login brute force protection

## 2026-06-03
Added user-based license brute force protection.

- Added user-specific failed license activation tracking
- Added user-specific license activation lockout handling
- Added license lockout checks based on the authenticated session user
- Added failed license activation recording for both user and IP address
- Added cleanup for user and IP license attempt counters after successful activation
- Improved protection against license key brute forcing when the same user changes IP address

## 2026-06-04
Implemented email-based login verification flow.

- Added pending login verification with separate email verification and polling tokens
- Updated login flow so password validation no longer creates a session immediately
- Added email link approval for pending logins
- Added login status endpoint for frontend polling
- Moved real session creation to the verified pending-login completion step
- Improved security by keeping session tokens out of browser email verification links

## 2026-06-04
Improved authentication security logic.

- Removed username-based login lockout from the active login flow
- Kept failed login tracking for user-level attack visibility
- Simplified failed login tracking to update attempt count and timestamp only
- Prevented account lockout denial-of-service against valid users
- Kept IP-based brute-force protection as the active blocking layer
- Confirmed email-based login verification remains required before session creation

## 2026-06-08
Improved database transaction safety in AuthManager.

- Refactored license activation to reserve license keys inside a transaction.
- Added row locking with SELECT ... FOR UPDATE for license key activation.
- Replaced separate unused-key lookup and mark-used operations with a safer reserve_license_key() flow.
- Updated pending login completion to use a transaction.
- Added row locking to prevent duplicate session creation from the same pending login.
- Added transaction-aware create_session() overloads using an existing database connection.
- Added clearer technical comments for transaction-critical code.

## 2026-06-08
Improved Database.cpp reliability and maintainability.

- Added cleanup for expired sessions.
- Added cleanup for expired pending login entries.
- Added exception handling to additional database operations.
- Improved comments across Database.cpp.
- Documented transaction-critical authentication and license flows.
- Clarified token hashing, session creation, lockout handling, and cleanup logic.

## 2026-06-08
Added audit logging to AuthManager.

- Added audit_logs database table support.
- Added audit log creation functions to Database.
- Added audit events for login, email verification, logout, license activation, lockouts, invalid sessions, missing tokens, and malformed requests.
- Added IP address tracking for audit events.
- Improved traceability for authentication and licensing workflows.

## 2026-06-08
Added automated testing support using GoogleTest.

Configured a dedicated AuthManagerTests executable through CMake and integrated GoogleTest into the build pipeline.

Implemented the first unit tests covering password hashing and password verification functionality.

Verified successful execution of automated tests and established the foundation for future database, authentication, session, and licensing integration tests.

## 2026-06-08
Added automated backend testing with GoogleTest.

Configured a dedicated AuthManagerTests executable through CMake and integrated GoogleTest into the build pipeline.

Implemented 16 automated tests covering password hashing, password verification, user registration, username and email lookup, pending login session creation, logout/session invalidation, email verification, license activation, reused license rejection, invalid license rejection, and audit logging.

Added MariaDB-backed integration tests to validate real database behavior instead of only isolated unit-level logic.

All 16 tests currently pass successfully, establishing a strong automated testing foundation for future backend development.

## 2026-06-08
Expanded automated backend testing.

Added route-level tests for AuthRoutes and extended the GoogleTest suite to cover 27 passing tests across 7 test suites.

Current test coverage includes password hashing, password verification, user registration, username/email lookup, pending login session creation, logout/session invalidation, email verification, license activation, reused/invalid license rejection, audit log creation, route input validation, and auth route helper validation.

Also connected route tests to the CMake test target and linked the required backend dependencies including Crow, OpenSSL, CURL, MariaDB Connector, sodium, and GoogleTest.

All 27 automated tests pass successfully.

## 2026-06-08
Cleaned automated test output.

Moved console output suppression into a reusable test helper and applied it to tests that intentionally trigger validation or logout messages.

The automated test suite now runs cleanly with 27 passing tests across 7 test suites, without unnecessary console noise.

This improves readability of test results and makes the test suite presentation more professional for portfolio and documentation use.

## 2026-06-08
Expanded automated backend test coverage.

Added additional database integration tests for duplicate username handling, duplicate email handling, and login authentication behavior.

The automated test suite now includes 32 passing tests across 8 test suites, covering password hashing, password verification, user registration, duplicate registration prevention, authentication, session management, email verification, license activation, audit logging, and route validation.

Cleaned test output by suppressing expected console messages during negative test cases.

All automated tests currently pass successfully.
