#/bin/env bash

FILE_BINDING_PROFILE=("config_files/profile" "~/.profile")
FILE_BINDING_NVIM=("config_files/init.vim" "~/.config/nvim/init.vim")

# Takes src and dst files
function replace_files {
  src="$1"
  dst="$2"

  mkdir -p "$(dirname "$dst")"
  cp -i "$src" "$dst"
}


function main {
  replace_files "${FILE_BINDING_PROFILE[@]}"
  replace_files "${FILE_BINDING_NVIM[@]}"
}

main "$@"
