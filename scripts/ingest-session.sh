#!/usr/bin/env bash
# Ingest the most recent Claude session into local Obsidian vault + sync to yash-brain on GitHub.
# Called from the Stop hook in ~/.claude/settings.json after every Claude response.

set -euo pipefail

VAULT_DIR="/Users/tanishqsingh/Desktop/yash desktop files/ybrain"
SESSIONS_DIR="$HOME/.claude/projects/-Users-tanishqsingh--claude"
SESSIONS_OUTPUT_DIR="$VAULT_DIR/claude-sessions"
GBRAIN_CLI="$HOME/.local/bin/gbrain"
SECRETS_FILE="$HOME/.claude/secrets/.env"

# Load secrets if available
if [ -f "$SECRETS_FILE" ]; then
  # shellcheck disable=SC1090
  source "$SECRETS_FILE" 2>/dev/null || true
fi

# Find the most recently modified session transcript
LATEST_JSONL=$(find "$SESSIONS_DIR" -name "*.jsonl" -newer "$SESSIONS_DIR" 2>/dev/null \
  | sort -t/ -k1 | tail -1)

# Fallback: just the most recently modified file
if [ -z "$LATEST_JSONL" ]; then
  LATEST_JSONL=$(ls -t "$SESSIONS_DIR"/*.jsonl 2>/dev/null | head -1)
fi

if [ -z "$LATEST_JSONL" ]; then
  echo '{"systemMessage": "No session transcript found — skipping ingest"}'
  exit 0
fi

SESSION_ID=$(basename "$LATEST_JSONL" .jsonl)
TIMESTAMP=$(date +'%Y-%m-%d %H:%M')
DATE=$(date +'%Y-%m-%d')
NOTE_FILE="$SESSIONS_OUTPUT_DIR/${DATE}-${SESSION_ID:0:8}.md"

# Extract human turns (user messages) and assistant summaries from the JSONL
SUMMARY=$(python3 - "$LATEST_JSONL" <<'PYEOF'
import json, sys, textwrap

path = sys.argv[1]
messages = []
with open(path) as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        try:
            obj = json.loads(line)
        except json.JSONDecodeError:
            continue
        # Claude Code JSONL format: each line is a message event
        msg_type = obj.get("type", "")
        if msg_type == "user":
            content = obj.get("message", {}).get("content", "")
            if isinstance(content, list):
                texts = [c.get("text","") for c in content if isinstance(c,dict) and c.get("type")=="text"]
                content = " ".join(texts)
            if content and len(content.strip()) > 5:
                messages.append(("user", content.strip()[:500]))
        elif msg_type == "assistant":
            content = obj.get("message", {}).get("content", "")
            if isinstance(content, list):
                texts = [c.get("text","") for c in content if isinstance(c,dict) and c.get("type")=="text"]
                content = " ".join(texts)
            if content and len(content.strip()) > 20:
                messages.append(("assistant", content.strip()[:1000]))

if not messages:
    print("No messages extracted")
    sys.exit(0)

# Build a concise summary
lines = []
for role, text in messages[:20]:  # cap at first 20 exchanges
    short = text.replace("\n", " ")[:300]
    lines.append(f"**{role.capitalize()}:** {short}")

print("\n\n".join(lines))
PYEOF
)

if [ -z "$SUMMARY" ] || [ "$SUMMARY" = "No messages extracted" ]; then
  echo '{"systemMessage": "Session transcript empty — skipping ingest"}'
  exit 0
fi

# Create vault output directory
mkdir -p "$SESSIONS_OUTPUT_DIR"

# Write markdown note to Obsidian vault
cat > "$NOTE_FILE" <<MDEOF
---
date: $TIMESTAMP
session_id: $SESSION_ID
source: claude-code
tags: [claude-session, ai-chat]
---

# Claude Session — $DATE

> Auto-captured at session end.

## Conversation Summary

$SUMMARY
MDEOF

# Ingest into local gbrain (PGLite) if available
if [ -x "$GBRAIN_CLI" ]; then
  "$GBRAIN_CLI" add "$(cat "$NOTE_FILE")" --source claude-sessions 2>/dev/null || true
fi

# Sync all brain sources into vault before pushing to GitHub
BRAIN_REPO_DIR="$VAULT_DIR"
if [ -d "$BRAIN_REPO_DIR/.git" ]; then
  # 1. Mirror claude project memory files → vault/memory/
  mkdir -p "$BRAIN_REPO_DIR/memory"
  find "$HOME/.claude/projects" -path "*/memory/*.md" 2>/dev/null | while read -r mf; do
    proj=$(basename "$(dirname "$(dirname "$mf")")")
    dest="$BRAIN_REPO_DIR/memory/${proj}__$(basename "$mf")"
    cp "$mf" "$dest" 2>/dev/null || true
  done

  # 2. Mirror gstack analytics + learnings → vault/gstack/
  if [ -d "$HOME/.gstack/analytics" ]; then
    mkdir -p "$BRAIN_REPO_DIR/gstack/analytics"
    cp "$HOME/.gstack/analytics/"*.jsonl "$BRAIN_REPO_DIR/gstack/analytics/" 2>/dev/null || true
  fi
  if [ -d "$HOME/.gstack/projects" ]; then
    mkdir -p "$BRAIN_REPO_DIR/gstack/projects"
    find "$HOME/.gstack/projects" -name "learnings.jsonl" 2>/dev/null | while read -r lf; do
      proj=$(basename "$(dirname "$lf")")
      cp "$lf" "$BRAIN_REPO_DIR/gstack/projects/${proj}-learnings.jsonl" 2>/dev/null || true
    done
  fi

  # 3. Commit everything and push to yashs33244/yash-brain
  (
    cd "$BRAIN_REPO_DIR"
    git add -A
    if ! git diff --cached --quiet; then
      git commit -m "brain: sync ${SESSION_ID:0:8} — $(date +'%Y-%m-%d %H:%M')"
      git push origin main 2>/dev/null && true
    fi
  ) 2>/dev/null || true
fi

echo "{\"systemMessage\": \"Session ingested → $NOTE_FILE\"}"
