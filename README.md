# my-mac-claude

Combined Claude skills library for macOS. Clone this into `~/.claude` and your Claude setup is complete.

## Sources

This repo combines skills from three curated collections:

- **Anthropic Example Skills** — Document processing (Excel, Word, PowerPoint, PDF), visual design, web testing, and skill creation
- **Superpowers** — Core development workflows: TDD, debugging, collaboration patterns, and proven techniques
- **Matt Pocock Skills** — Engineering and productivity skills for daily code work and workflow optimization

## macOS Setup

```bash
git clone https://github.com/yashs33244/my-mac-claude.git ~/.claude
```

That's it. Claude will automatically pick up the skills from `~/.claude/.claude-plugin/plugin.json`.

## Structure

```
.claude-plugin/
  plugin.json       — Main manifest listing all skills
  marketplace.json    — Marketplace listing by category
skills/
  anthropic/        — Anthropic example skills
  superpowers/      — Superpowers workflow skills
  mattpocock/       — Matt Pocock's engineering & productivity skills
    engineering/
    productivity/
    misc/
    personal/
    deprecated/
CLAUDE.md          — Combined guidelines and commands
```

## Skills Included

### Anthropic Examples
- `algorithmic-art` — Generate algorithmic art
- `brand-guidelines` — Create brand guidelines
- `canvas-design` — Design with HTML canvas
- `claude-api` — Claude API and SDK documentation
- `doc-coauthoring` — Document coauthoring
- `docx` — Word document processing
- `frontend-design` — Frontend design
- `internal-comms` — Internal communications
- `mcp-builder` — MCP builder
- `pdf` — PDF processing
- `pptx` — PowerPoint processing
- `skill-creator` — Create new skills
- `slack-gif-creator` — Create Slack GIFs
- `theme-factory` — Theme styling
- `web-artifacts-builder` — Build web artifacts
- `webapp-testing` — Web app testing
- `xlsx` — Excel processing

### Superpowers
- `brainstorming` — Structured brainstorming
- `dispatching-parallel-agents` — Parallel agent dispatch
- `executing-plans` — Plan execution
- `finishing-a-development-branch` — Finish dev branches
- `receiving-code-review` — Receive code review
- `requesting-code-review` — Request code review
- `subagent-driven-development` — Subagent development
- `systematic-debugging` — Systematic debugging
- `test-driven-development` — TDD workflows
- `using-git-worktrees` — Git worktrees
- `using-superpowers` — Superpowers overview
- `verification-before-completion` — Pre-completion verification
- `writing-plans` — Plan writing
- `writing-skills` — Skill writing

### Matt Pocock
- `engineering/diagnose` — Diagnose issues
- `engineering/grill-with-docs` — Grill with documentation
- `engineering/triage` — Triage problems
- `engineering/improve-codebase-architecture` — Improve architecture
- `engineering/setup-matt-pocock-skills` — Setup guide
- `engineering/tdd` — TDD approach
- `engineering/to-issues` — Convert to issues
- `engineering/to-prd` — Convert to PRD
- `engineering/zoom-out` — Zoom out for context
- `productivity/caveman` — Caveman debugging
- `productivity/grill-me` — Self-review
- `productivity/write-a-skill` — Write new skills

## License

MIT
