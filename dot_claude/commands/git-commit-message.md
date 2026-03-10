---
allowed-tools: Bash(/usr/bin/git diff:*), Bash(gds:*), Bash(cat)
description: Create git commit message
model: haiku
context: fork
---



## Context
- Changes: !`/usr/bin/git diff --staged`

## Your Task
- create a commit message using conventional commits to describe staged changes. 
- First line of the commit message should be no longer than 50 chars.
- `av init`
- Create commit. Try with `av commit` if it doesn't work, use `/usr/bin/git commit`
