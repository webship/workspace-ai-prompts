---
name: ai-prompts-workflow
description: How work is done in the `ai-prompts/` folder of the Webship Workspace — what a prompt is there and the shape it has, how the prompts of the folder are listed, pulled from the shared repository, run from the New screen form, copied to adapt and proposed back with `cmd-tools-ai-items.sh`, with every flag of the command and the settings keys of the folder. Use when asked to "write a prompt", "where do prompts go", "why can a prompt not be installed", "pull the shared prompts", or when a file of `ai-prompts/` is about to be written.
argument-hint: '[what you are about to do in ai-prompts]'
---

# ai-prompts-workflow

`~/workspace/ai-prompts` is the AI Prompts folder of a Webship Workspace (container-based, DDEV by default).
AI Prompts holds the prompts of the workspace as items a person edits in place: one prompt is one file, `~/workspace/ai-prompts/<name>.md`: the start of a new session, with placeholders to fill in. It comes with the AI Prompts plugin (`@webship.co/workspace-ai-prompts`), which places the commands below in the folder. Every command finds the workspace from its own path; run it from the folder, and read `bash <command> --help` before quoting a flag.

## The order of work

1. **See what is where**: `bash cmd-tools-ai-items.sh`.
2. **Start from one that exists**: `bash cmd-tools-ai-items.sh my-prompt --clone-to my-prompt-2`, or
   write `~/workspace/ai-prompts/my-prompt.md` in the shape below.
3. **Read it as its reader would**: an AI assistant that knows nothing else about the work.
4. **Run it** from the New screen form of the dashboard, with its placeholders filled in.
5. **Share it** when it proved useful: `bash cmd-tools-ai-items.sh my-prompt --propose --summary "what it is for"`.

## Commands

| Command | What it does | Flags |
| --- | --- | --- |
| `cmd-tool-backup-prompt.sh` | One prompt as an archive, into `backups/ai-prompts/`: `<name>` | none |
| `cmd-tools-ai-items.sh` | The prompts of this folder against the shared repository: `[name]`. With no flag it shows what each place has. `--install`, `--add`, `--update`, `--check` and `--fetch` are refused: a prompt is run, not installed | `--add` `--check` `--clone-to` `--confirm` `--fetch` `--filter` `--install` `--list-remote` `--propose` `--pull` `--purpose` `--source` `--status` `--summary` `--to` `--update` |

## The shape of a prompt

A prompt is a markdown file with no frontmatter:

| Part | What it holds |
| --- | --- |
| The first line | One sentence that says what the prompt is for |
| A fenced block | The whole launch command of a new session: the launch line of the default AI CLI ending in three double quotes, the text, and three double quotes to close it |
| The text | What the session is to do, as numbered steps, with `<placeholders>` to fill in and a `#` line that says where it runs. It can be given to another AI CLI as it is |
| No install | A prompt is not installed anywhere: the New screen form of the dashboard lists it as the start of a new session |

Names are short, lowercase, with hyphens, and start with what the prompt belongs to. A command and a prompt never share a name.

## Settings

| Key | File | What it says |
| --- | --- | --- |
| `doc.name` | `core/config/workspace.ai-prompts.settings.yml` | The folder under the workspace root: `ai-prompts` |
| `type` | `core/config/workspace.ai-prompts.settings.yml` | `ai-items`: the page lists AI items, with its own install, fetch and propose actions |
| `assistant.name`, `assistant.placeholder` | `core/config/workspace.ai-prompts.settings.yml` | What the assistant is called on this page; `default` takes the workspace's |
| `workspaces` | `core/config/settings.yml` | The active folders; `ai-prompts` is on it once the plugin is activated |
| `sources.ai_items.repo`, `sources.ai_items.ref` | `core/config/settings.yml` | The shared repository `--list-remote`, `--pull` and `--propose` talk to, and its branch |

## Rules

- **The folder is the draft, the AI CLI is the copy.** Change a prompt here, then run it from the New screen form; never edit a copy elsewhere.
- **`--pull` and `--add` bring in what somebody else wrote.** Read a prompt before it is run: it tells an AI assistant what to do on this machine.
- **`--propose` prints its plan and stops**; `--confirm` files an issue and opens a request on the shared repository: only when asked.
- **Nothing private in a prompt**: no password, no token, no personal path; addresses are example addresses.
- **The body is plain Markdown any AI CLI can follow.** Claude Code is the default shape (the frontmatter, the launch line of a prompt), never a requirement.
- **Back up before a rewrite**: `bash cmd-tool-backup-prompt.sh <name>`.
- The workspace is container-based (DDEV by default): a prompt that describes it says so.

The AI Prompts plugin places these beside this one, each in the workspace folder of its kind: the agent `ai-prompts-keeper` (`ai-agents/`), the command `/ai-prompts-clone` (`ai-commands/`) and the prompt `ai-prompts-write-a-new-prompt` (`ai-prompts/`).

## The book

For any automated functional testing in this work (a Gherkin feature, a step definition, choosing a
step, a test run and its failures), read the book *Automated Functional Testing Recipes* first.

- **Where.** Use the first that exists: `.claude/automated-functional-testing-recipes/` in the project,
  `~/.claude/automated-functional-testing-recipes/` (installed by webship/webship-js-ai-agent,
  webship/webship-js-skills or webship/ai-agents), or
  https://github.com/webship/webship-js-ai-agent/tree/2.0.x/automated-functional-testing-recipes
- **How.** Its `README.md` first, then the chapter that matches the task (one file per chapter,
  named by its subject), not the single complete file.
- **Which wins.** The installed webship-js package and the step pack are the source of truth for
  step phrasing. When they differ from the book, follow them and say so.
