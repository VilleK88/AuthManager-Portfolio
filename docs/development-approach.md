# Development Approach

## Project Goal

The goal of AuthManager was to design and implement a reusable authentication and licensing backend suitable for desktop applications, websites, and future commercial software projects.

## Development Philosophy

The project was developed using an iterative approach.

Each feature followed the same process:

1. Design
2. Implementation
3. Manual validation
4. Automated testing
5. Documentation

## Technologies

### Backend

* C++20
* Crow
* MariaDB
* OpenSSL
* libsodium
* cURL

### Desktop Client

* Qt
* QML

### Testing

* GoogleTest
* CMake

## Key Engineering Practices

### Security First

Security considerations were incorporated throughout development:

* Password hashing
* Session protection
* Email verification
* Login confirmation workflows
* Audit logging

### Automated Testing

Automated tests were added to verify:

* Authentication
* Sessions
* Licensing
* Email verification
* Audit logging

### Documentation

Development progress was continuously documented through:

* Development logs
* Architecture documentation
* Testing documentation
* Demonstration videos

## Future Plans

Potential future improvements include:

* AWS deployment
* CI/CD pipeline integration
* Docker containerization
* Extended API coverage
* Additional automated testing
* Monitoring and observability features
