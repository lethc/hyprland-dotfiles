#!/usr/bin/env bash
set -euo pipefail

CHOOSER_FILE=$(mktemp -t "herdr-yazi-chooser.XXXXXX")

yazi ~/Projects/ --chooser-file="$CHOOSER_FILE"

SELECTED=$(head -n1 "$CHOOSER_FILE" 2>/dev/null || true)
rm -f "$CHOOSER_FILE"

[ -n "$SELECTED" ] && [ -d "$SELECTED" ] || exit 0

herdr workspace create --cwd "$SELECTED" --label "$(basename "$SELECTED")" --focus
