#!/bin/env bash

stat_list="${STAT_LIST:-./stat.txt}"

function main {
  all_installed=true
  while read -r program; do
    if ! $(command -v "$program" 1>/dev/null); then
      if [ "$all_installed" == "true" ]; then
        echo "Missing programs:"
        all_installed=false
      fi

      echo "- "$program""
    fi
  done < <(cat "$stat_list" | sort)

  if [ "$all_installed" == "true" ]; then
    echo "All programs are installed"
  fi
}

main "$@"
