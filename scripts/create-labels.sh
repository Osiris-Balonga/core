#!/usr/bin/env bash
# Creates (or updates) the labels from .github/labels.yml. Requires the GitHub CLI, authenticated.
# Usage: scripts/create-labels.sh [owner/repo]
set -euo pipefail
REPO="${1:-$(gh repo view --json nameWithOwner -q .nameWithOwner)}"

grep -E '^- \{' .github/labels.yml | while IFS= read -r line; do
  name=$(sed -E 's/.*name: "([^"]+)".*/\1/' <<<"$line")
  color=$(sed -E 's/.*color: "([^"]+)".*/\1/' <<<"$line")
  desc=$(sed -E 's/.*description: "([^"]*)".*/\1/' <<<"$line")
  gh label create "$name" --repo "$REPO" --color "$color" --description "$desc" --force
done
echo "✓ labels synced on $REPO"
