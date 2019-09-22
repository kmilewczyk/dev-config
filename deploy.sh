#/bin/env bash

FILE_BINDING_PROFILE=("config_files/profile" ~/.profile)
FILE_BINDING_NVIM=("config_files/init.vim" ~/.config/nvim/init.vim)
FILE_BINDING_TMUX=("config_files/tmux.conf" ~/.tmux.conf)

# Takes src and dst files
function replace_files {
  src="$1"
  dst="$2"

  mkdir -p "$(dirname "$dst")"
  cp -i "$src" "$dst"
}


function main {
  pushd $(dirname $0)

  replace_files "${FILE_BINDING_PROFILE[@]}"
  replace_files "${FILE_BINDING_NVIM[@]}"
  replace_files "${FILE_BINDING_TMUX[@]}"

  popd
}

main "$@"
