#!/bin/env bash


function main {
  pushd $(dirname $0) >/dev/null

  # Copy rclonesync stub repo to bin
  cp --parents -r ./rclonesync-V2/ ~/bin/rclonesync-V2/
  sudo ln -sfn ${HOME}/bin/rclonesync-V2/rclonesync.py /usr/bin/rclonesync

  # Copy systemd units
  cp --parents ./rclonesync\.* ~/.config/systemd/user/ >/dev/null

  # Check for rclone
  if ! command -v rclone &>/dev/null; then
    echo "Rclone is not installed!" 2>&1
  fi

  popd >/dev/null
}

main "$@"
