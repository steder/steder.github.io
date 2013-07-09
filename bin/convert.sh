#!/usr/bin/env bash

set -e -u -x

markdown=${1%.html}.md

pandoc -f html -t markdown $1 -o $markdown
git rm $1
git add $markdown
