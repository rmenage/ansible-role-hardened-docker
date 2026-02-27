#!/usr/bin/env bash

set -euo -pipefail

version=$(cat VERSION)
readme_update=$(date "+%Y-%m-%d")

echo "dt_update: $readme_update" >.docsible
echo "version: $version" >>.docsible

docsible --role . --playbook molecule/default/converge.yml --no-backup --md-template docsible-template.md
