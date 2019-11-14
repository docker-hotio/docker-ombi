#!/bin/bash

version=$(curl -fsSL "https://ci.appveyor.com/api/projects/tidusjar/requestplex/history?recordsNumber=100" | jq -r '. | first(.builds[] | select(.status == "success") | select(.branch =="develop") | select(.pullRequestId == null)) | .version')
jobid=$(curl -fsSL "https://ci.appveyor.com/api/projects/tidusjar/requestplex/build/${version}" | jq -r '.build.jobs[0].jobId')
find . -type f -name '*.Dockerfile' -exec sed -i "s/ARG OMBI_VERSION=.*$/ARG OMBI_VERSION=${version}/g" {} \;
find . -type f -name '*.Dockerfile' -exec sed -i "s/ARG OMBI_JOBID=.*$/ARG OMBI_JOBID=${jobid}/g" {} \;
sed -i "s/{TAG_VERSION=.*}$/{TAG_VERSION=${version}}/g" .drone.yml
echo "##[set-output name=version;]${version}"
