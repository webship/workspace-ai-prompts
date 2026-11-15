# @webship.co/workspace-ai-prompts

The **AI Prompts** workspace of the [Webship Workspace](https://github.com/webship/workspace) dashboard:
the `ai-prompts/` folder (type `ai-items`), its settings file (`core/config/workspace.ai-prompts.settings.yml`),
its commands and its docs, as a plugin.

## Use it

```bash
cd ~/workspace
bash core/scripts/plugins.sh --require github:webship/workspace-ai-prompts
bash core/scripts/plugins.sh --activate ai-prompts     # puts `ai-prompts` on the workspaces list of settings.yml
bash core/scripts/plugins.sh --install ai-prompts      # the folder, its settings file (once), its commands, its docs (once)
```

The settings file and the docs are placed once and never overwritten: they hold what you put there.
`--deactivate` takes the workspace off the list; the folder and its content stay.

## What it goes with

The folder needs no other plugin. Its items of the other kinds land in the other AI folders (`ai-agents`, `ai-skills`, `ai-commands`), which the manifest suggests and never adds: the four AI folders cannot need each other, a circle of needs is refused. While one of them is not an active workspace folder, `--install` says `skipped` for that kind and the items are placed, with no second step, once the folder is activated.

## The AI items

The plugin carries its own AI items (`ai/` in the package, the manifest's `ai` block), written for the work this folder is for. `--install` places each one in the workspace folder of its kind, when that folder is an active workspace folder; `--uninstall` removes them, and keeps one that was edited in its folder.

| Item | Kind | Lands in | What it is for |
| --- | --- | --- | --- |
| `ai-prompts-keeper` | Agent | `ai-agents/ai-prompts-keeper.md` | Looks after the prompts of `ai-prompts/` with `cmd-tools-ai-items.sh`: what is where, pull, copy to adapt, propose back, back up |
| `ai-prompts-workflow` | Skill | `ai-skills/ai-prompts-workflow/` | How work is done in `ai-prompts/`: the shape of a prompt, the order of work, every flag of `cmd-tools-ai-items.sh`, the settings keys |
| `/ai-prompts-clone` | Command | `ai-commands/ai-prompts-clone.md` | `/ai-prompts-clone <prompt> <new name>`: copies a prompt under a new name and says what to change in the copy |
| `ai-prompts-write-a-new-prompt` | Prompt | `ai-prompts/ai-prompts-write-a-new-prompt.md` | A new session that writes a new prompt in the shape the folder lists; itself the example of a prompt |

From its folder an item is installed into the AI CLI (Claude Code by default) like any other: the folder's page on the dashboard, or `bash cmd-tools-ai-items.sh <name> --install` in the folder (`--to dev/<project>` for one project). A prompt is not installed: the New screen form lists it as the start of a new session. The body of every item is plain Markdown any AI CLI can follow; Claude Code is the default shape (the frontmatter, the launch line of a prompt). Every command, flag, settings key and path an item names is checked by `tests/items.test.ts`; the shape of the items is the one of the reference, [`docs/plugin-items-pattern.md` of the WordPress plugin](https://github.com/webship/workspace-wordpress/blob/1.0.x/docs/plugin-items-pattern.md).

## The commands

| Command |
| --- |
| `cmd-tool-backup-prompt.sh` |
| `cmd-tools-ai-items.sh` |

The bash functions these commands call live in the dashboard's `core/scripts/functions`.

## Several repositories

With a base that has it (after 1.0.10), the folder takes its prompts from more than one repository, each recorded in
`ai-prompts/.ai-sources.lock.json` so it is listed, checked, updated and removed on its own:

```bash
cd ~/workspace/ai-prompts
bash cmd-tools-ai-items.sh --sources                                   # each source, its state, its prompts and theirs
bash cmd-tools-ai-items.sh --source-add owner/repo                     # GitHub
bash cmd-tools-ai-items.sh --source-add https://git.drupalcode.org/project/name/-/tree/1.0.x/folder   # GitLab, any host
bash cmd-tools-ai-items.sh --source-add https://bitbucket.org/workspace/repo/src/main/folder
bash cmd-tools-ai-items.sh --source-check                              # ask upstream; changes nothing here
bash cmd-tools-ai-items.sh <id> --source-update                        # --force replaces one changed here
bash cmd-tools-ai-items.sh --source-remove <id>
```

What is fetched is files only: each one is shown, none is run.
A prompt is the launch command of a new session, so it is run and not installed into an AI CLI;
`bash cmd-tools-ai-items.sh --clis` lists the AI CLIs of the settings.
The same is on the dashboard: **Sources and AI CLIs** in the rail of the folder's page. The guide is
`core/docs/ai-items-any-cli.md` in the workspace.
