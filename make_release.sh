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
  if [ -z "$1" ]; then
    echo -e "$DOC"
    return 1
  fi

  if [ "$1" = "plan" ]; then
    plan=1
    apply=0
  elif [ "$1" = "apply" ]; then
    apply=1
    plan=0
  fi

  # Define variables and their default
  current_branch=$(git branch --show-current)
  new_version=$(git-cliff --bumped-version)
  changelog_file="CHANGELOG.md"
  if [ "$plan" == 1 ]; then
    main_branch=$current_branch
    gc_cmd="echo git-cliff"
    git_cmd="echo git"
  fi
  if [ "$apply" == 1 ]; then
    main_branch="main"
    gc_cmd="git-cliff"
    git_cmd="git"
  fi
  cl_cmd="$gc_cmd --bump --unreleased --prepend $changelog_file"
  add_cf="$git_cmd add \"$changelog_file\""
  commit_cf="$git_cmd commit -m \"docs: update changelog for version up to $new_version\""
  push_cf="$git_cmd push origin"
  create_tag="$git_cmd tag -as \"$new_version\" -m \"new release for version $new_version\""
  push_tag="$git_cmd push origin \"$new_version\""

  # bail out if not on main branch
  if [ "$current_branch" != "$main_branch" ]; then
    echo "error: '$current_branch' is not '$main_branch'"
    return 1
  fi

  # update CHANGELOG
  eval "$cl_cmd"

  # create and push changelog
  eval "$add_cf"
  eval "$commit_cf"
  eval "$push_cf"
  # create and push tag
  eval "$create_tag"
  eval "$push_tag"

  # output new changelog snippet to stdout when in plan mode
  if [ "$plan" == 1 ]; then
    echo "---"
    echo "will be prepended to $changelog_file:"
    git-cliff --bump --unreleased
  fi
  echo "---"
  echo "If this looks good, run '$0 apply' to execute the above plan"
  return 0
}

make_release "$@"
