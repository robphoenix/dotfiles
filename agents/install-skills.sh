#!/usr/bin/env bash
set -euo pipefail

lock="$(dirname "$0")/.skill-lock.json"

jq -r '.skills | to_entries[] | "\(.value.source) \(.key)"' "$lock" |
  while read -r source name; do
    npx skills add "$source" --skill "$name" -g -a claude-code -y
  done
