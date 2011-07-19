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
# Install Git from Source Code
#
# ############################################################

pushd /usr/local/src

EXPAT_VERSION=2.0.1
curl -o expat-${EXPAT_VERSION}.tar.gz http://cdnetworks-us-1.dl.sourceforge.net/project/expat/expat/${EXPAT_VERSION}/expat-${EXPAT_VERSION}.tar.gz
tar xzvf expat-${EXPAT_VERSION}.tar.gz
pushd expat-${EXPAT_VERSION}
  ./configure
  make
  make install
popd

ZLIB_VERSION=1.2.5
curl -o zlib-${ZLIB_VERSION}.tar.gz http://zlib.net/zlib-${ZLIB_VERSION}.tar.gz
tar xzvf zlib-${ZLIB_VERSION}.tar.gz
pushd zlib-${ZLIB_VERSION}
  ./configure
  make
  make install
popd

OPENSSL_VERSION=1.0.0d
curl -o openssl-${OPENSSL_VERSION}.tar.gz http://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz
tar xzvf openssl-${OPENSSL_VERSION}.tar.gz
pushd openssl-${OPENSSL_VERSION}
  case "$VENDOR_TYPE" in
    Debian)
      ./Configure darwin64-x86_64-cc
      ;;
    *)
      ./config
      ;;
  esac
  make
  make install
popd

LIBSSH_VERSION=1.2.8
curl -o libssh2-${LIBSSH_VERSION}.tar.gz http://www.libssh2.org/download/libssh2-${LIBSSH_VERSION}.tar.gz
tar xzvf libssh2-${LIBSSH_VERSION}.tar.gz
cd libssh2-${LIBSSH_VERSION}
  ./configure 
  make
  make install
popd

CURL_VERSION=7.21.7
curl -o curl-${CURL_VERSION}.tar.gz http://curl.haxx.se/download/curl-${CURL_VERSION}.tar.gz
tar xzvf curl-${CURL_VERSION}.tar.gz
pushd curl-${CURL_VERSION}
  ./configure 
  make
  make install
popd

GIT_VERSION=1.7.6
curl -o git-${GIT_VERSION}.tar.gz http://kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz
tar xzvf git-${GIT_VERSION}.tar.gz
pushd git-${GIT_VERSION}
  ./configure 
  make
  make install
popd

popd

$root_dir/git-config/set-gitconfig.sh
$root_dir/git-config/set-gitignore-core.sh

