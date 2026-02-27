#!/usr/bin/env bash

#
# make_release.sh - bump to a new version
# this entails:
# - Update and push to GitLab the CHANGELOG.md wtih new entry for the new version
# - Create and push to GitLab a new git tag for that version
# This script is to be run on the "main" branch only

set -eo pipefail

# usage doc
DOC="Make a release.

Usage:
  $0        Show this help message
  $0 plan   Dry-run mode, will print to STDOUT the commands, the new version and the changelog changes
  $0 apply  Real mode, will run the real commands shown to the user in dry-run mode
"

make_release() {
  # Sourcing local environment variables
  source .env

  # parse arguments
  arg="$1"

  if [ -z "$arg" ]; then
    echo -e "$DOC"
    return 1
  fi

  if [ "$arg" = "plan" ]; then
    git_cmd="echo git"
  elif [ "$arg" = "apply" ]; then
    git_cmd="git"
  else
    echo "error: invalid command: $arg"
    return 1
  fi

  # Define variables and their default
  current_branch=$(git branch --show-current || echo "$CI_COMMIT_REF_NAME")
  default_branch=${CI_DEFAULT_BRANCH:-"main"}
  new_version=$(git-cliff --bumped-version)

  #Output version to a file so we can use it between jobs
  echo "$new_version" >VERSION

  # Switch to dry-run mode if current branch is not the default
  if [ "$current_branch" != "$default_branch" ]; then
    echo "warning: '$current_branch' is not '$default_branch', enabling dry-run mode"
    git_cmd="echo git"
  fi

  git_status=$(git status --short)
  if [[ -n $git_status ]]; then
    if [ "echo git" == "$git_cmd" ]; then
      echo "warning: There are uncommmited files, exiting"
    else
      echo "error: There are uncommmited files, exiting"
      return 1
    fi
  fi

  # Update changelog
  git-cliff --bump --unreleased --prepend CHANGELOG.md

  # Update README to include version if we do it for real
  if [ "git" == "$git_cmd" ]; then
    ./generate_readme.sh
  fi

  # Commit changelog and README
  $git_cmd add CHANGELOG.md README.md
  $git_cmd commit -m "docs: update changelog for version up to $new_version"
  $git_cmd pull --rebase origin "$current_branch"
  $git_cmd push -o ci.skip origin

  # Create and push tag
  $git_cmd tag -as "$new_version" -m "release for version $new_version"
  $git_cmd push origin "$new_version"

  if [ "echo git" == "$git_cmd" ]; then
    # Output new changelog change to stdout when in plan mode
    echo "---"
    echo "changes to CHANGELOG.md:"
    git --no-pager diff -U1 CHANGELOG.md
    echo "---"
    echo "If this looks good, run '$0 apply' to execute the above plan"
    # Since this is dry-run mode, revert the change to the file
    git checkout HEAD -- CHANGELOG.md
  fi
  return 0
}

make_release "$@"
