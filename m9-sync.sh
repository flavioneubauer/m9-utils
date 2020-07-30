#!/bin/bash

# m9-sync: push to gitlab the local time tracking

# current env
source $HOME/.m9-current

ISSUE="$2"
MYDIR="$(dirname $(realpath $0))"
MYTIME=$($MYDIR/m9-times.sh $1)
ELT=$(date --date "%H:%M:%S.%N" -d "$MYTIME" +"%Hh%Mm%Ss")

echo "registering $ELT for $ISSUE"
echo "token $M9_GITLAB_TOKEN and $M9_GITLAB_PRJ"

# reset time
curl --request POST --header "PRIVATE-TOKEN: $M9_GITLAB_TOKEN" "$M9_GITLAB_URL/api/v4/projects/$M9_GITLAB_PRJ/issues/$ISSUE/reset_spent_time"
# set time
curl --request POST --header "PRIVATE-TOKEN: $M9_GITLAB_TOKEN" "$M9_GITLAB_URL/api/v4/projects/$M9_GITLAB_PRJ/issues/$ISSUE/add_spent_time?duration=$ELT"
