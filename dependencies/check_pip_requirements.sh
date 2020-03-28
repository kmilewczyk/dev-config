#!/bin/env bash

stat_list="${STAT_LIST:-dependencies/stat.txt}"

function main {
  missing="$(comm -23 <(cat requirements.txt) <(python -m pip freeze | sed -e "s#\(.*\)==.*#\1#"))"
  if [ "$missing" == "" ]; then
    echo "All modules are installed"
  else
    echo "Missing pip modules:"
    echo "$missing"
  fi
}

main "$@"
