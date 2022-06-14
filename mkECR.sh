#!/usr/bin/env bash
set -euo pipefail

# test ECR access
set +e
aws ecr get-login-password >/dev/null
ret="$?"
set -e
if [[ $ret -ne 0 ]]; then
  echo "Please login to the AWS first via 'aws-azure-login --profile aws-pop-dev'"
  echo "for more information see: https://confluence.playtech.corp/display/GPAS/Access+to+AWS+POP+Environments"
  exit 1
fi

for r in $(yq -r '.images[].name' ./build.yml); do
  repo="repo/${r}"
  set +e
  aws ecr describe-repositories --repository-names ${repo} >/dev/null 2>&1
  ret="$?"
  set -e
  if [[ $ret -eq 254 ]]; then
    echo "creating ${repo} repository"
    aws ecr create-repository --image-tag-mutability MUTABLE --repository-name ${repo}
  else
    echo "${repo} already exist"
  fi
done
