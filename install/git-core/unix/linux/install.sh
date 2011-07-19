#!/bin/bash

# ############################################################
#
# Common Prolog
#
# ############################################################

root_rel_path=../../..

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

if [ "$(whoami)" != "root" ]; then
  echo "You need to be root to run this!"
  exit 2
fi

# ############################################################
#
# Install Git using Package Managers
#
# ############################################################

# upgrade the system and install required packages

case "$DISTRO_TYPE" in
  Debian)
    apt-get -y install git-core
    apt-get -y install git-email
    ;;
  RedHat)
    yum -y install git
    yum -y install git-email
    ;;
  Darwin)
    echo "Darwin unsupported. Please contribute commands and drop them here."
    exit 2
    ;;
esac

$root_dir/git-config/set-gitconfig.sh
$root_dir/git-config/set-gitignore-core.sh

