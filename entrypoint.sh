#!/bin/bash
set -e

[[ $DEBUG ]] && set -x

. .asdf/asdf.sh

asdf plugin-add ${INPUT_NAME} ${INPUT_URL}
asdf install ${INPUT_NAME} ${INPUT_VERSION}
asdf global ${INPUT_NAME} ${INPUT_VERSION}

asdf info

echo ${INPUT_THESE}
IFS=$'\n'
for plugin in ${INPUT_THESE}; do
  echo ${plugin}
done
