---
description: Copy a prompt of the ai-prompts/ folder of the Webship Workspace under a new name to adapt it, with cmd-tools-ai-items.sh --clone-to, and say what to change in the copy.
argument-hint: '<prompt> <new name> [what the copy is for]'
---

# /ai-prompts-clone

Copy the prompt of `~/workspace/ai-prompts` named in: `$ARGUMENTS`

The arguments are the text typed after the command: the first word is the prompt (its name in
`ai-prompts/`), the second word is the name of the copy, and what follows says what the copy is for.
With a word missing, stop and ask for it. The workspace is container-based (DDEV by default);
a copy is a file, and starts nothing.

## 1. Find it, and read it

```bash
cd ~/workspace/ai-prompts
bash cmd-tools-ai-items.sh
```

Read the prompt: its first sentence, its placeholders, the steps it gives.

## 2. Copy

```bash
ls <new name>.md 2>/dev/null
bash cmd-tools-ai-items.sh <prompt> --clone-to <new name>
```

If a prompt of the new name exists, stop and say so. Leave `--purpose` out: with it the command
hands the copy to an AI CLI to rewrite, which takes a minute and is asked for by name only.

## 3. Say what to change

Open `<new name>.md` and say, from what the copy is for, which placeholders and which steps
would change. Change them only when asked. A prompt is not installed: it is run from the New
screen form of the dashboard. For the shape of a prompt, see the `ai-prompts-workflow` skill; for sharing the
copy, the `ai-prompts-keeper` agent.
