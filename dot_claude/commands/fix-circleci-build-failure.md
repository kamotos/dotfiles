---
allowed-tools: Bash(git rev-parse:*), Bash(git status:*)
description: Fix CircleCI build failure.
---

## Context
- Current branch: !`git rev-parse --abbrev-ref HEAD`


## Your Task
1. MCP tool circleci: get_build_failure_logs for current branch
2. print the workflow job link

- If the error is "panic: Could not start localstack: error creating container: container already exists, rerun_workflow (circleci) from failed job.


- Otherwise fix the errors. 

DO NOT GIT COMMIT.  
