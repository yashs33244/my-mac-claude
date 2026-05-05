# my-mac-claude — Combined Guidelines

## If You Are an AI Agent

This is a personal combined skills library for macOS. When working with this repo:

1. Skills are organized under `skills/` by source collection:
   - `skills/anthropic/` — Anthropic example skills (document processing, design, testing)
   - `skills/superpowers/` — Core development workflows (TDD, debugging, collaboration)
   - `skills/mattpocock/` — Matt Pocock's engineering & productivity skills

2. Every skill must have a `SKILL.md` file in its directory.

3. The top-level `.claude-plugin/plugin.json` is the main manifest. Keep it in sync when adding/removing skills.

4. The `.claude-plugin/marketplace.json` organizes skills into logical groups for the marketplace.

## macOS Setup

```bash
git clone https://github.com/yashs33244/my-mac-claude.git ~/.claude
```

Claude will automatically discover and load all skills from `~/.claude/.claude-plugin/plugin.json`.

## Adding New Skills

1. Create a new directory under the appropriate `skills/` subfolder
2. Add a `SKILL.md` file following the standard format
3. Register the skill path in both `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`
4. Update `README.md` with a one-line description

## License

MIT
