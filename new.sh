#!/bin/bash
NAME=$(echo $1 |sed 's/ /-/g' | awk '{print tolower($0)}')

if [[ $NAME == "" ]]; then
  echo "Must provide name for blog post!"
  exit 1
fi

if [[ $2 != "" ]]; then
  echo "Remember to quote the name of the blog post!"
  exit 1
fi

if which hugo >/dev/null; then
  hugo new post/$NAME.md --editor $EDITOR
else
  echo "Hugo not installed!" && exit 1
fi
