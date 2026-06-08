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


## 2026-05-27
Major authentication architecture update.

The application was refactored from direct database access into a proper client-server architecture. The Qt/QML frontend now communicates with AuthManagerApi through HTTP requests instead of accessing the database directly.

This update introduces:
- centralized authentication backend
- REST API endpoints
- token-based authentication
- signup/login/logout flow
- frontend/backend separation
- improved error handling
- authentication debug logging

## 2026-05-28
Implemented license management flow.

- Added license activation through AuthManagerApi
- Added active license retrieval through backend API
- Updated Qt/QML frontend to use asynchronous license signals
- Added active license list view
- Added empty-state message for users without active licenses
- Fixed license list layout and scroll clipping under TopMenuBar

## 2026-05-28
Refactored frontend styling and reusable QML components.

- Added centralized AppTheme.js for colors, typography, and layout values
- Added reusable AppCard component with shared card styling and shadow effect
- Replaced duplicated hardcoded colors and spacing values
- Updated Dashboard, Login, License, and Active Licenses pages to use shared theme values
- Improved login page layout and status message spacing
- Improved visual consistency across the Qt/QML frontend

## 2026-05-28
Implemented session persistence and startup session restoration.

- Added backend session validation endpoint
- Added frontend session validation requests through ApiClient
- Added persistent local session storage using QSettings
- Added automatic session restoration on application startup
- Added automatic dashboard login for valid stored sessions
- Added stored session cleanup on logout
- Refactored Main.qml startup flow to support dynamic page loading
- Removed static LoginPage initialization from StackView
- Improved reusable login form sizing through AppTheme
- Fixed TextField border rendering/layout issue on LoginPage

## 2026-05-29
Improved authentication UI request handling.

- Added loading state to LoginPage
- Disabled login input fields during login request
- Disabled Sign In button while login request is running
- Added dynamic Sign In button text during authentication
- Added loading state to RegisterPage
- Disabled registration input fields during signup request
- Disabled Create account button while signup request is running
- Disabled navigation back to login during active signup request
- Improved user feedback during asynchronous authentication operations
- Reduced risk of duplicate login and signup requests

## 2026-06-02
Updated AuthManagerGUI to support HTTPS communication.

- Migrated API communication from HTTP to HTTPS
- Updated API base URL to use secure connections
- Added SSL handling for local self-signed development certificates
- Added SSL support to login, signup, logout, session validation and license requests
- Fixed RegisterPage layout and card sizing
- Aligned RegisterPage styling with LoginPage
- Improved spacing and status message positioning on registration form

## 2026-06-03
Cleaned up frontend project structure.

- Removed unnecessary backend files from the AuthManager Qt/QML client project
- Removed unused backend-related libraries from the frontend repository
- Kept backend-specific code separated in AuthManagerAPI
- Improved repository structure and project maintainability
- Reduced confusion between frontend and backend responsibilities

## 2026-06-04
Added frontend polling support for login verification.

- Updated login flow to handle pending email verification
- Added polling for backend login status after verification email is sent
- Saved session token only after backend confirms verified login
- Restored logout functionality with the new verified session flow
- Added login status messaging while waiting for email confirmation
