#!/bin/env bash


replacement_file=${REPLACEMENT_FILE:-"./replacement_paths.txt"}

# Takes src and dst files
function replace_files {
  src="$1"
  dst="${2/#\~/$HOME}"

  mkdir -p "$(dirname "$dst")"
  cp -r "$src" "$dst"
}


function main {
  pushd $(dirname $0) >/dev/null

  while IFS= read -r line; do
    linearr=($line)
    echo "${linearr[0]}" "${linearr[1]}"
    replace_files "${linearr[0]}" "${linearr[1]}" 1>/dev/null 2>/dev/null
  done < "$replacement_file"

  popd >/dev/null
}

main "$@"
