### Mocks
- Never modify generated mock files

### Tests
- Add test cases should exist in test functions instead of creating new ones. 
- Use table-driven tests
- For error assertion use assert.ErrorAssertionFunc
- Unused function parameters should be set to `_` (instead of an unused variable name)
- When writing files from different packages, do each pacakge using a separate concurrent teammate or sub-agent

### git
- Always prefer using `av` or `/usr/bin/git`. NEVER use `git` directly
