Write a new prompt in the ai-prompts folder, in the shape the New screen form reads.

The launch line is for Claude Code, the default; the text between the triple quotes can be given to another AI CLI as it is.

```
claude --permission-mode bypassPermissions """
Write a new prompt named <name> in the ai-prompts folder, for: <what-for>
# ~/workspace/ai-prompts/<name>.md · an item edited in place · container-based (DDEV by default)
# a prompt is the start of a new session: it is run, never installed; no password, no token, no personal path

1. bash cmd-tools-ai-items.sh
   tell me whether a prompt for this exists already; if one does, propose to adapt it instead
2. read one prompt of the folder that is close to this, for its shape
3. ask me what the session must do, in which folder it runs, and what it must never do
4. write the file: one sentence that says what it is for, then a fenced block with the launch
   line of the default AI CLI, the steps as a numbered list with placeholders in angle brackets,
   a line starting with # that says where it runs, and the closing quotes
   every command, flag and path in it is one you ran or opened
5. show me the file

Do not run the prompt. Tell me how it is started: from the New screen form of the dashboard.
"""
```
