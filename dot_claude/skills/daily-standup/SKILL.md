---
name: daily-standup
description: Use when the user asks to write, draft, or prepare their daily standup update, or says "standup", "standup update", "what did I do yesterday", or needs a summary of their recent work across GitHub, Jira, Confluence, Google Drive, and Slack.
---

# Daily Standup

Draft the user's daily standup as bullet points, split into **Yesterday** and **Today**, by scanning their activity across five sources.

## Procedure

### 1. Resolve identity (once per session)

Run these in parallel; cache results in the current response:

- `mcp__plugin_atlassian_atlassian__getAccessibleAtlassianResources` → grab `cloudId`
- `mcp__plugin_atlassian_atlassian__atlassianUserInfo` → grab `accountId` + display name + email
- `gh api user --jq '.login'` via Bash → GitHub login

### 2. Compute the date window

- **Today** = local date (see the `currentDate` context block).
- **Yesterday** = previous *business* day. If today is Monday, yesterday = last Friday. If Sunday, yesterday = Friday. Otherwise, yesterday = today − 1.
- Use ISO `YYYY-MM-DD` for all queries.

### 3. Scan all five sources IN PARALLEL (single message, multiple tool calls)

**GitHub PRs** (Bash):
```bash
gh search prs --author=@me --updated=">=YYYY-MM-DD" --json number,title,url,state,repository,updatedAt,isDraft --limit 30
gh search prs --review-requested=@me --updated=">=YYYY-MM-DD" --json number,title,url,state,repository,updatedAt --limit 20
```

**Jira** (`searchJiraIssuesUsingJql`):
```
(assignee = currentUser() OR reporter = currentUser()) AND updated >= -2d ORDER BY updated DESC
```
Request fields: `summary,status,updated,issuetype,priority`. `maxResults: 50`.

**Confluence** (`searchConfluenceUsingCql`):
```
(contributor = currentUser() OR mention = currentUser()) AND lastModified >= now("-2d") ORDER BY lastModified DESC
```

**Google Drive** (`mcp__glean__search`): two calls, one for each day bucket.
- `query: "*"`, `app: "gdrive"`, `from: "me"`, `updated: "yesterday"` (and `"today"`)

**Slack** (`mcp__glean__search`): two calls.
- `query: "*"`, `app: "slack"`, `from: "me"`, `updated: "yesterday"` (and `"today"`)

### 4. Bucket items into Yesterday / Today

- **Yesterday bucket:** anything last updated on the yesterday date.
- **Today bucket:**
  - items updated today, OR
  - open/in-progress PRs and Jira tickets from yesterday that the user will likely continue (still open, still assigned).
- Dedupe: if a Jira ticket and its linked PR both appear, keep the PR line and append the ticket key in brackets.

### 5. Filter out noise

Drop:
- Bot-authored PRs (dependabot, renovate)
- Jira updates where the only change was status transition by someone else
- Slack messages that are just emoji reactions
- Confluence auto-generated comments

### 6. Render output

Use exactly this template — bullet points only, no prose:

```
**Yesterday**
- [JIRA-123] <summary> — <status> (<link>)
- PR #456 merged: <title> (<repo>) (<url>)
- Reviewed design doc: <title> (<gdrive link>)
- Slack: <thread topic> in #channel

**Today**
- [JIRA-124] Continue <summary>
- PR #457 in review: <title>
- <meeting or planned work>
```

Keep each bullet to one line. Include links inline.

## Quick reference

| Source | Tool | Key filter |
|---|---|---|
| GitHub | `gh search prs` | `--author=@me` + `--updated` |
| Jira | `searchJiraIssuesUsingJql` | `assignee/reporter = currentUser()` |
| Confluence | `searchConfluenceUsingCql` | `contributor = currentUser()` |
| Google Drive | `glean search` | `app:gdrive from:me` |
| Slack | `glean search` | `app:slack from:me` |

## Common pitfalls

- **Timezone drift:** Glean's `updated:today` is based on the Glean index's timezone; cross-check dates against the `updatedAt` field in returned results and rebucket if needed.
- **Empty sources are fine:** If a source returns nothing, omit it silently — don't write "No Slack activity".
- **Don't speculate about "Today":** Only list concrete, already-planned work (open PRs, in-progress tickets, scheduled meetings). Don't invent tasks.
- **Weekend runs:** If invoked on Monday, explicitly say "Yesterday (Fri)" in the header.
