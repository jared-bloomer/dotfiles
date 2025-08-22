---
applyTo: '**'
title: Rally Rich Text Fields
description: This document provides a comprehensive guide to the HTML tags supported in Rally's Rich Text Fields.
author: "Jared Bloomer"
creation_date: "2025-08-22"
version: "1.0.0"
type: ai-interaction
---

# Rally Rich Text Fields - HTML Formatting Guide

## Overview

Rally supports Rich Text Fields that can be formatted with HTML. This document provides the reference for which fields support HTML and what tags are allowed.

## Rich Text Fields in Rally

The following Rally fields support HTML formatting:

- **Description** - Work item descriptions
- **Notes** - Work item notes/comments
- Other text fields may also support rich text formatting

## Allowed HTML Tags

The following HTML tags are supported and may be entered when editing and creating work items. HTML tags may also be used when creating or editing work items through the Rally Web Services API.

**Important:** Tags not listed below will automatically be removed from text fields when saving.

### Supported Tags

| Tag                                | Attributes                                                   | Notes                                       |
| ---------------------------------- | ------------------------------------------------------------ | ------------------------------------------- |
| `a`                                | `href` attribute                                             | Supports ftp, http, https, mailto protocols |
| `b`                                | -                                                            | Bold text                                   |
| `blockquote`                       | -                                                            | Supports http, https protocols              |
| `br`                               | -                                                            | Line break                                  |
| `center`                           | -                                                            | Center alignment                            |
| `cite`                             | -                                                            | Citation                                    |
| `code`                             | -                                                            | Code formatting                             |
| `col`                              | -                                                            | Table column                                |
| `colgroup`                         | -                                                            | Table column group                          |
| `div`                              | -                                                            | Division/container                          |
| `dd`                               | -                                                            | Description list item                       |
| `dl`                               | -                                                            | Description list                            |
| `dt`                               | -                                                            | Description list term                       |
| `em`                               | -                                                            | Emphasis (italic)                           |
| `font`                             | `color`, `face`, `size` attributes                           | Font formatting                             |
| `h1`, `h2`, `h3`, `h4`, `h5`, `h6` | -                                                            | Headers                                     |
| `hr`                               | -                                                            | Horizontal rule                             |
| `i`                                | -                                                            | Italic text                                 |
| `img`                              | `align`, `alt`, `height`, `src`, `title`, `width` attributes | Images (src supports http, https protocols) |
| `li`                               | -                                                            | List item                                   |
| `ol`                               | -                                                            | Ordered list                                |
| `p`                                | -                                                            | Paragraph                                   |
| `pre`                              | -                                                            | Preformatted text                           |
| `q`                                | -                                                            | Quote                                       |
| `small`                            | -                                                            | Small text                                  |
| `span`                             | -                                                            | Inline container                            |
| `strike`                           | -                                                            | Strikethrough text                          |
| `strong`                           | -                                                            | Strong emphasis (bold)                      |
| `style`                            | -                                                            | Style definitions                           |
| `sub`                              | -                                                            | Subscript                                   |
| `sup`                              | -                                                            | Superscript                                 |
| `table`                            | -                                                            | Table                                       |
| `tbody`                            | -                                                            | Table body                                  |
| `td`                               | -                                                            | Table cell                                  |
| `tfoot`                            | -                                                            | Table footer                                |
| `th`                               | -                                                            | Table header cell                           |
| `thead`                            | -                                                            | Table header                                |
| `tr`                               | -                                                            | Table row                                   |
| `u`                                | -                                                            | Underlined text                             |
| `ul`                               | -                                                            | Unordered list                              |

### Universal Attributes

**Style, width, height, color, and size attributes are allowed on all supported tags.**

## Best Practices for Rally HTML Formatting

### 1. Structure and Hierarchy

- Use `<h3>`, `<h4>` for section headers
- Use `<hr>` to separate major sections
- Use `<p>` for proper paragraph structure

### 2. Lists and Organization

- Use `<ul>` for bulleted lists
- Use `<ol>` for numbered/ordered lists
- Use `<li>` for list items

### 3. Technical Content

- Use `<code>` for file names, commands, technical terms
- Use `<strong>` or `<b>` for emphasis
- Use `<em>` for subtle emphasis

### 4. Links and References

- Use `<a href="">` for external links (http, https, mailto protocols only)

### 5. Visual Enhancement

- Use emojis for visual appeal (✅, 🔄, 📋, etc.)
- Use consistent formatting patterns
- Keep structure readable and scannable

## Example Usage

```html
<h3>✅ MILESTONE COMPLETED</h3>
<p><strong>Progress Summary:</strong></p>
<ul>
  <li>✅ <strong>Milestone 1:</strong> Analysis Complete</li>
  <li>🔄 <strong>Milestone 2:</strong> In Progress</li>
</ul>

<h4>Technical Details:</h4>
<p>Created <code>workflow-template.yml</code> with the following features:</p>
<ol>
  <li>Integration with <code>custom-action@v1</code></li>
  <li>Slack notifications to <code>#ci-cd-notifications</code></li>
</ol>

<hr />

<p><em>Next Steps:</em> Begin implementation phase</p>
```

## API Usage

When using the Rally Web Services API to update fields, include HTML directly in the field value:

```json
{
  "notes": "<h3>Update</h3><p>Progress completed successfully.</p>"
}
```

## Notes

- Always test HTML formatting in Rally to ensure proper rendering
- Rally will automatically strip unsupported tags
- Keep formatting simple and readable
- Use semantic HTML for better accessibility
