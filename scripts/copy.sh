#!/bin/sh

set -eu

SELF_DIR=$( (cd $(dirname $0); pwd) )
REPO_DIR=$( (cd "${SELF_DIR}/.."; pwd) )

NPM_REPO_LIST="
chat-ui-react
chat-ui-react/examples/echo-bot
chat-ui-react/examples/cdn
config-js
config-js/packages/commitlint-config
config-js/packages/eslint-config
config-js/packages/prettier-config
config-js/packages/stylelint-config
hello-webpack
nestjs-starter
nestjs-lambda-starter
nextjs-starter
"
PIPENV_REPO_LIST="
django-starter
"

main() {
  cd "${REPO_DIR}"
  for _repo in ${NPM_REPO_LIST}; do
    mkdir -p -v "${_repo}"
    cp -v "../${_repo}/package.json" "${_repo}"
    if [ -e "../${_repo}/yarn.lock" ]; then
      cp -v "../${_repo}/yarn.lock" "${_repo}"
    fi
  done
  for _repo in ${PIPENV_REPO_LIST}; do
    mkdir -p -v "${_repo}"
    cp -v "../${_repo}/Pipfile" "${_repo}"
    if [ -e "../${_repo}/Pipfile.lock" ]; then
      cp -v "../${_repo}/Pipfile.lock" "${_repo}"
    fi
  done
}

main "$@"
