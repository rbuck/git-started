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

if [ "$(whoami)" != "root" ]; then
  echo "You need to be root to run this!"
  exit 2
fi

# ############################################################
#
# Install Perforce Merge Tools
#
# ############################################################

# verify third-party directory is available

export THIRD_PARTY=/opt/thirdparty/os_cpu/$KERNEL_TYPE/$MACHINE_TYPE
if [ ! -d $THIRD_PARTY ]; then
  mkdir -p $THIRD_PARTY
fi

# install p4merge...

case "$KERNEL_TYPE" in
  Linux)
    case "$MACHINE_TYPE" in
      x86)
        P4MERGE_WGET_URI=http://www.perforce.com/downloads/perforce/r10.1/bin.linux26x86/p4v.tgz
        ;;
      x86_64)
        P4MERGE_WGET_URI=http://www.perforce.com/downloads/perforce/r10.1/bin.linux26x86_64/p4v.tgz
        ;;
    esac
    ;;
  Darwin)
    P4MERGE_WGET_URI=http://www.perforce.com/downloads/perforce/r10.1/bin.macosx104u/P4V.dmg
    # must update this script to help here to install dmg from command line...
    # http://commandlinemac.blogspot.com/2008/12/installing-dmg-application-from-command.html
    echo "Please contribute back to this project; help needed for Mac. Research done, just need leg work."
    exit 2
    ;;
  *)
    echo "Install script not set up to download p4merge."
    exit 2
    ;;
esac

if [ ! -d $THIRD_PARTY/perforce/2010.1 ]; then
  pushd /var/tmp
    if [ ! -f p4v.tgz ]; then
      wget -dc $P4MERGE_WGET_URI > /dev/null 2>&1
      if [ $? -ne 0 ]; then
        echo "Failed to download perforce merge tools; try again..."
        exit 1
      fi
    else
      if [ -d p4v-2010.1.256349 ]; then
        rm -fr p4v-2010.1.256349
      fi
    fi
    tar xvfz p4v.tgz > /dev/null 2>&1
    if [ $? -ne 0 ]; then
      echo "Failed to unzip perforce merge tools; perhaps perforce is blocking wget downloads of p4v."
      echo "  Try downloading manually into /var/tmp and restart."
      rm -fr rm -fr p4v-2010.1.256349
      exit 1
    fi
    pushd p4v-2010.1.256349 
      mkdir -p $THIRD_PARTY/perforce/2010.1
      if [ -f $THIRD_PARTY/perforce/latest ]; then
        rm -f $THIRD_PARTY/perforce/latest
      fi
      ln -s $THIRD_PARTY/perforce/2010.1 $THIRD_PARTY/perforce/latest
      cp -r * $THIRD_PARTY/perforce/latest
      if [ -f /usr/local/bin/p4merge ]; then
        rm -f /usr/local/bin/p4merge
      fi
      ln -s $THIRD_PARTY/perforce/latest/bin/p4merge /usr/local/bin/p4merge
    popd
  popd
fi

# suggested settings, integration with p4merge is recommended, likely the best merge tool you'll run across

git config --global difftool.prompt false
git config --global mergetool.prompt false
git config --global diff.tool p4merge
git config --global merge.tool p4merge
git config --global mergetool.p4merge.cmd 'p4merge "$BASE" "$REMOTE" "$LOCAL" "$MERGED"'
git config --global mergetool.keepbackup false
