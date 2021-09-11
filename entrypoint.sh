#!/bin/bash
set -e

balckhole='&> /dev/null'
if [[ $DEBUG ]]; then
  set -x
  unset balckhole
fi

. .asdf/asdf.sh

IFS=$'\n'
for plugin in ${INPUT_THESE}; do
  name="$(cut -d' ' -f1 <<<$plugin)"
  url="$(cut -d' ' -f3 <<<$plugin)"
  version="$(cut -d' ' -f2 <<<$plugin)"
  asdf plugin-add ${name} ${url} ${balckhole}
  asdf install ${name} ${version} ${balckhole}
  asdf global ${name} ${version} ${balckhole}
done

asdf info
