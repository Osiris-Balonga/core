#!/usr/bin/env bash
# Creates the milestones and starter issues from docs/issues/*.md, in file order.
# Run it ONCE on a fresh repository, before any issue or pull request exists:
# data files and fixtures refer to issues by number (#1, #2, #8, #9, #10).
#
# Usage: scripts/create-issues.sh [owner/repo]
# Requires the GitHub CLI (gh), authenticated, and labels created first (scripts/create-labels.sh).
set -euo pipefail
REPO="${1:-$(gh repo view --json nameWithOwner -q .nameWithOwner)}"

# Issues and pull requests share one numbering: both must be absent.
existing=$(gh api "repos/$REPO/issues?state=all&per_page=1" --jq 'length')
if [ "$existing" != "0" ]; then
  echo "✗ $REPO already has issues or pull requests: numbering would not match the references in data/ and fixtures/." >&2
  echo "  Create the issues by hand, then update those references." >&2
  exit 1
fi

for m in v0.1 v0.2 v0.3 v0.4 v1.0; do
  gh api "repos/$REPO/milestones" -f title="$m" >/dev/null 2>&1 && echo "✓ milestone $m" || echo "· milestone $m already exists"
done

for file in docs/issues/[0-9]*.md; do
  front=$(awk '/^---$/{n++; next} n==1' "$file")
  body=$(awk '/^---$/{n++; next} n>=2' "$file")
  title=$(sed -nE 's/^title: "(.*)"$/\1/p' <<<"$front")
  labels=$(sed -nE 's/^labels: (.*)$/\1/p' <<<"$front" | sed 's/, /,/g')
  milestone=$(sed -nE 's/^milestone: (.*)$/\1/p' <<<"$front")
  url=$(gh issue create --repo "$REPO" --title "$title" --body "$body" --label "$labels" --milestone "$milestone")
  echo "✓ $url  $title"
done
