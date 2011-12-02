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

source $root_dir/.helpers/detect-system.sh


# ############################################################
#
# Configure Araxis Merge Tools
#
# ############################################################

case "$KERNEL_TYPE" in
  Darwin)
    git config --global diff.tool araxis
    git config --global difftool.prompt false
    git config --global difftool.araxis.path "/Applications/Araxis Merge Utilities/compare"
    git config --global difftool.araxis.cmd '"/Applications/Araxis Merge Utilities/compare" -2 "$LOCAL" "$REMOTE"'
    git config --global merge.tool araxis
    git config --global mergetool.prompt false
    git config --global mergetool.araxis.cmd '"/Applications/Araxis Merge.app/Contents/MacOS/Araxis Merge" "$LOCAL" "$REMOTE" "$MERGED" "$BASE"'
    git config --global mergetool.keepbackup false
    ;;
  *)
    echo "Unsupported configuration."
    exit 2
    ;;
esac

