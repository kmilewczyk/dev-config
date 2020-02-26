#!/bin/env bash

stat_list="${STAT_LIST:-dependencies/stat.txt}"

function main {
  echo "Dependency list:"

  while read -r program; do
    if $(command -v "$program" 1>/dev/null); then
      echo "[*] "$program""
    else
      echo "[ ] "$program""
    fi
  done < <(cat "$stat_list" | sort)
}

main "$@"
