#!/bin/bash
set -e

[[ $DEBUG ]] && set -x

. .asdf/asdf.sh

IFS=$'\n'
for plugin in ${INPUT_THESE}; do
  name="$(cut -d' ' -f1 <<<$plugin)"
  url="$(cut -d' ' -f3 <<<$plugin)"
  version="$(cut -d' ' -f2 <<<$plugin)"
  asdf plugin-add ${name} ${url}
  asdf install ${name} ${version}
  asdf global ${name} ${version}
done

asdf info
