---
applyTo: '**'
---

# Error Handling Standards

This document outlines best practices for error handling in this project to ensure reliability, maintainability, and clear communication of issues.

## 1. General Principles
- Handle errors gracefully and avoid application crashes.
- Always provide meaningful error messages for users and developers.
- Avoid exposing sensitive information in error responses or logs.

## 2. Logging Errors
- Log errors with sufficient context (timestamp, user, operation, stack trace).
- Use structured logging formats for easier analysis.
- Separate error logs from general application logs when possible.

## 3. User-Facing Errors
- Display clear, actionable messages to users without technical jargon.
- Do not reveal internal details, stack traces, or sensitive data.
- Provide guidance or next steps when possible (e.g., "Please try again later").

## 4. Developer-Facing Errors
- Include detailed information in logs for debugging (error type, location, stack trace).
- Use error codes or identifiers to facilitate troubleshooting.
- Document common error scenarios and their resolutions.

## 5. Exception Handling
- Catch exceptions at appropriate levels; avoid catching at the top level unless necessary.
- Use custom exception types for different error categories.
- Clean up resources (files, connections) in error scenarios.

## 6. Error Propagation
- Propagate errors up the call stack when necessary, but avoid excessive bubbling.
- Use consistent error handling patterns across the codebase.

---
_Consistent error handling improves user experience, simplifies debugging, and enhances system stability._
