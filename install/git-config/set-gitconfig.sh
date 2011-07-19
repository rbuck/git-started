#!/bin/bash

# ############################################################
#
# Common Prolog
#
# ############################################################

root_rel_path=..

self="$0"
self_name=`basename "$0"`
while [ -h "${self}" ]
do
    ls=`ls -ld "${self}"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "${link}" : '/.*' > /dev/null; then
        self="${link}"
    else
        self=`dirname "${this}"`"/${link}"
    fi
done
self_dir=`dirname "${self}"`
self_dir=`cd "${self_dir}" && pwd`
root_dir=$self_dir/$root_rel_path

# source $root_dir/.helpers/detect-system.sh

# ############################################################
#
# Core Configuration
#
# ############################################################

if [ $# -eq 4 ]; then
  $root_dir/git-config/set-gitconfig-user.sh
fi

# mandatory settings

# a nice feature, but there's some disagreement about it:
git config --global rerere.enabled true

git config --global core.autocrlf false
git config --global log.date iso
git config --global merge.log true

# optional; some users don't like colors, comment out if you do not
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

