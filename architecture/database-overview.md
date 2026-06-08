# Database Overview

## Overview

AuthManager uses MariaDB for persistent storage of authentication, session management, licensing, security monitoring, and audit logging data.

The database is designed to support reusable authentication and licensing functionality for desktop applications, websites, and future commercial software projects.

## High-Level Database Structure

```text
Users
 ├── Sessions
 ├── Pending Logins
 ├── Licenses
 └── Audit Logs

Products
 ├── License Keys
 └── Licenses

IP Login Attempts
IP License Attempts
```

## Main Entities

### Users

Stores user account information.

Responsibilities:

* User registration
* Authentication
* Email verification
* Account management

### Sessions

Stores active authenticated sessions.

Responsibilities:

* Session validation
* Session restoration
* Session expiration
* Logout handling

### Pending Logins

Stores temporary login verification requests.

Responsibilities:

* Login confirmation workflow
* Email-based authentication verification
* Temporary login state management

### Products

Stores information about licensable software products.

Responsibilities:

* Product identification
* Product metadata
* Subscription information

### License Keys

Stores generated license keys.

Responsibilities:

* License key management
* Activation tracking
* License key validation

### Licenses

Stores activated licenses associated with users and products.

Responsibilities:

* License ownership
* Product access control
* License lifecycle management

### Audit Logs

Stores security-related and operational events.

Responsibilities:

* Security monitoring
* Activity tracking
* Troubleshooting support
* Compliance support

### IP Login Attempts

Stores login attempt information.

Responsibilities:

* Brute-force attack mitigation
* Rate limiting
* Security monitoring

### IP License Attempts

Stores license activation attempts.

Responsibilities:

* License abuse prevention
* Rate limiting
* Security monitoring

## Design Goals

* Separation of authentication and licensing concerns
* Secure session management
* Scalable user management
* Product and license ownership tracking
* Auditability of security events
* Protection against automated abuse
* Future cloud deployment compatibility

## Security Features Supported by the Database

* Password hash storage
* Session token management
* Email verification workflows
* Login confirmation workflows
* License activation tracking
* Audit logging
* Login rate limiting
* License activation rate limiting
* Account activity monitoring

```
```
