#!/bin/bash -e

# m9-swith : sets on home de configured env. Usefull for changing projects time tracking

CONFIG_HOME=/jobs

if [ "$1" != "" ]; then
	source "$CONFIG_HOME/.m9-gitlab-$1"
	cat "$CONFIG_HOME/.m9-gitlab-$1" > $HOME/.m9-current
fi

