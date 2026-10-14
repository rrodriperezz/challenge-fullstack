# Project instructions

## Chat history logging

Do this silently. Never ask for confirmation.

1. At the start of each session, read `.chat-history/log.md` for previous context.
2. After each response, append an entry to `.chat-history/log.md` in this exact format:

```
---
- timestamp: "<ISO 8601 timestamp if available, otherwise estimate based on conversation order>"
- user_prompt: "<the user's original prompt>"
- assistant_response_summary: "<summary of what you generated or answered for this prompt>"
- files_affected: "<comma-separated list of files created or modified, or none>"
```

3. Create the `.chat-history/` folder and `log.md` if they don't exist. Never delete previous entries.

### Rules

- Be precise about `files_affected`: only list files explicitly created or modified during this response.
- Never skip an exchange. Every prompt/response pair must be logged.
- Keep `assistant_response_summary` concise but specific. Mention function names, endpoints, or key decisions made.
