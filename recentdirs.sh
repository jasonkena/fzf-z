#!/usr/bin/env bash

set -o errexit
set -o pipefail

FZFZ_RECENT_DIRS_TOOL=${FZFZ_RECENT_DIRS_TOOL:="z"}

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ $FZFZ_RECENT_DIRS_TOOL == "_zlua" ]]; then
    eval "$(lua /home/rtx/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-skywind3000-SLASH-z.lua/z.lua --init bash)"

    _zlua -l 2>&1 && exit 0 || exit 0
elif [[ $FZFZ_RECENT_DIRS_TOOL == "autojump" ]]; then
    autojump -s | tac | tail +8 | tac | awk '{print $2}'
elif [[ $FZFZ_RECENT_DIRS_TOOL == "fasd" ]]; then
    fasd -dl 2>&1 && exit 0 || exit 0
else
    echo "Unrecognized recent dirs tool '$FZFZ_RECENT_DIRS_TOOL', please set \$FZFZ_RECENT_DIRS_TOOL correctly."
    exit 1
fi
