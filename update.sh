#!/bin/bash

###################
version=$(curl -fsSL "https://ci.appveyor.com/api/projects/tidusjar/requestplex/history?recordsNumber=100" | jq -r '. | first(.builds[] | select(.status == "success") | select(.branch =="develop") | select(.pullRequestId == null)) | .version')
jobid=$(curl -fsSL "https://ci.appveyor.com/api/projects/tidusjar/requestplex/build/${version}" | jq -r '.build.jobs[0].jobId')
app=OMBI
###################

location=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "${location}" || exit 1

find . -type f -name '*.Dockerfile' -exec sed -i "s/ARG ${app}_VERSION=.*$/ARG ${app}_VERSION=${version}/g" {} \;
find . -type f -name '*.Dockerfile' -exec sed -i "s/ARG ${app}_JOBID=.*$/ARG ${app}_JOBID=${jobid}/g" {} \;
sed -i "s/{TAG_VERSION=.*}$/{TAG_VERSION=${version}}/g" .drone.yml

if [[ -n "$(git status --untracked-files=no --porcelain)" ]]; then
    git add ./*.Dockerfile
    git add ./.drone.yml
    git commit -m "Updated version to: ${version}"
    echo "Updated version to: ${version}"
else
    echo "Version is still: ${version}"
fi
