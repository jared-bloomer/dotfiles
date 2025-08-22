# Copilot Instructions Setup Guide

This repository provides a standardized way to configure the `.ai/instructions` directory for use with GitHub Copilot in VS Code. Follow these steps to ensure Copilot can leverage your custom instructions for better code suggestions and team alignment.

## 1. Directory Structure
Create the following directory and files in your repository root:

```
.ai/
  instructions/
    acceptance-criteria-definitions.md
    assumptions.md
    feature-development.md
    git-commit-messages.md
    pull-request-descriptions.md
    rally-rich-text-fields.instructions.md
    session-handoff.md
    security-best-practices.md
    error-handling-standards.md
```

## 2. Purpose of Each File
- **acceptance-criteria-definitions.md**: Define what makes a feature complete.
- **assumptions.md**: Guidance on making assumptions.
- **feature-development.md**: Outline development workflow and standards.
- **git-commit-messages.md**: Specify commit message conventions.
- **pull-request-descriptions.md**: Guide for writing effective PR descriptions.
- **rally-rich-text-fields.instructions.md**: Instructions for using Rally rich text fields.
- **session-handoff.md**: Context Documentation for handing off work between copilot sessions.
- **security-best-practices.md**: Security guidelines for the project.
- **error-handling-standards.md**: Error handling and logging standards.

## 3. Using in VS Code with Copilot
1. Open your repository in VS Code.
2. Ensure the `.ai/instructions` directory and files are present.
3. Reference these files when prompting Copilot for code generation, reviews, or documentation.
4. Update instructions as your team’s standards evolve.

## 4. Customization
You can add more instruction files as needed (e.g., onboarding, API docs, testing guidelines). Keep instructions clear and concise for best results.

## 5. Example Usage
When asking Copilot for help, mention relevant instruction files:
> "Follow the standards in `.ai/instructions/security-best-practices.md` when writing authentication code."

## 6. Version Control
Commit changes to instruction files to share updates with your team. Use pull requests for major changes to ensure team alignment.

---
_This setup helps Copilot provide context-aware suggestions and enforces team standards across your codebase._
