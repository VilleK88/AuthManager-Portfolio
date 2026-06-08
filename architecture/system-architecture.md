# System Architecture

## Overview

AuthManager is a backend authentication and licensing system developed in C++20. The project consists of a Qt/QML desktop client, a Crow-based REST API backend, and a MariaDB database.

The architecture separates presentation, business logic, and data storage responsibilities to improve maintainability and scalability.

## Architecture Diagram

```text
┌─────────────────┐
│   Desktop App   │
│  (Qt / QML)     │
└────────┬────────┘
         │ HTTPS
         ▼
┌─────────────────┐
│   Crow Backend  │
│     (C++20)     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Authentication  │
│ Licensing       │
│ Audit Logging   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     MariaDB     │
└─────────────────┘
```

## Main Components

### Qt/QML Client

Responsible for:

* User interface
* Registration workflow
* Login workflow
* License management
* Session restoration
* Communication with backend services

### Crow Backend

Responsible for:

* Request validation
* Authentication logic
* Session management
* Email verification
* License activation
* Audit logging

### MariaDB Database

Responsible for:

* User storage
* Session storage
* License management
* Product information
* Audit records

## Security Features

* Password hashing
* Session token protection
* Email verification
* Login confirmation emails
* Account lockout protection
* Audit logging

## Design Goals

* Reusable authentication backend
* Production-oriented architecture
* Clear separation of responsibilities
* Automated testing support
* Future cloud deployment support
