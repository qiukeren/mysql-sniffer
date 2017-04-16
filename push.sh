#!/bin/bash

# set -ex

go test .
[ $? -ne 0 ] && echo '[ERROR]test failed and exit' && exit -1 

go build .
[ $? -ne 0 ] && echo '[ERROR]test failed and exit' && exit -1 

commit="auto commit with no message"
if [[ "$1" == "" ]];
then
	echo "auto commit message"
else
	commit=$1
fi

echo $commit

git add .
git commit -m "$commit"
git push origin master

