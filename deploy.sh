#!/bin/env bash
# Script for hacky way of provisioning my own developer environment

USAGE="
Usage: deploy.sh <command> <options>
Available commands:
* dependencies - check for the dependencies.
* provision <plan> - copy configuration files, where they are meant to be.
* plan <plan> - display plan without the copying configuration files
"

action=""

function read_action {
  if [ "$#" == "0" ]; then
    echo "$USAGE" 1>&2
    exit 1
  fi

  action="$1"
}

function plan {
  if [ "$#" == "0" ]; then
    echo "$USAGE" 1>&2
    exit 1
  fi

  local plan="$1"

  if [ -d "provisioning/"$plan"" ] && [ -f "provisioning/"$plan"/plan.md" ]; then
    cat "provisioning/"$plan"/plan.md"
  else
    echo "Plan "$plan" is not found." 1>&2
    exit 1
  fi
}

function provision {
  if [ "$#" == "0" ]; then
    echo "$USAGE" 1>&2
    exit 1
  fi

  local plan="$1"

  if [ -d "provisioning/"$plan"" ] && [ -f "provisioning/"$plan"/main.sh" ]; then
    bash "provisioning/"$plan"/main.sh"
  else
    echo "Plan "$plan" is not found." 1>&2
    exit 1
  fi
}

function dependencies {
  pushd dependencies >/dev/null

  bash check_installed_programs.sh
  bash check_pip_requirements.sh

  popd >/dev/null
}


function main {
  read_action "$@"
  shift

  case "$action" in
    plan)
      plan "$@"
      ;;
    provision)
      provision "$@"
      ;;
    dependencies)
      dependencies "$@"
      ;;
    *)
      echo "$USAGE" 1>&2
      exit 1
      ;;
  esac
}

main "$@"
