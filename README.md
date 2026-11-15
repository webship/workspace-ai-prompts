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
