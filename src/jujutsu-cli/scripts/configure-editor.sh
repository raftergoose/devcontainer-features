#!/usr/bin/env sh
set -eu

# Generated/installed by the jujutsu-cli Dev Container Feature.
# Intended to run as the container user (remoteUser) on postStartCommand.

ENABLED_FILE="/usr/local/share/jujutsu-cli/configure-editor.enabled"

if [ ! -f "${ENABLED_FILE}" ]; then
  exit 0
fi

if ! command -v jj >/dev/null 2>&1; then
  exit 0
fi

mkdir -p "${HOME}/.config/jj"

jj config set --user ui.editor "code -w"
