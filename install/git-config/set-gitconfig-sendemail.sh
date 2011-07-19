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
# Install Email Packages Required By Git
#
# ############################################################

# script to set up smtp email from git through google to destination addresses.

# example:
#   git send-email -to emailaddr@hostedemail.com 0001-changed-to-hello-world.patch

function usage {
  echo >&2 "usage: $0 [-e smtp-encryption (tls|ssl)] [-p smtp-server-port] [-s smtp-user] [-u smtp-server]\n"
  exit 1
}

# GMail Settings:
# TLS Port: 587, smtpencryption=tls
# SSL Port: 465, smtpencryption=ssl
# SMTP Server: smtp.gmail.com

smtpuser=
smtpserver=smtp.gmail.com
smtpencryption=tls
smtpserverport=587
while [ $# -gt 0 ]
do
  case "$1" in
    -e) shift; smtpencryption=$1;;
    -p) shift; smtpserverport=$1;;
    -s) shift; smtpserver=$1;;
    -u) shift; smtpuser=$1;;
    *) usage;;
  esac
  shift
done
if [ -z "$smtpuser" ]; then
  echo "username undefined.\n"
  usage
  exit 1
fi

apt-cache search perl|grep ssl
apt-get install libio-socket-ssl-perl
apt-get install libmime-base64-urlsafe-perl
apt-get install libauthen-sasl-perl
apt-get install libnet-smtp-ssl-perl

git config --global sendemail.smtpuser $smtpuser
git config --global sendemail.smtpserver $smtpserver
git config --global sendemail.smtpserverport $smtpserverport
git config --global sendemail.smtpencryption $smtpencryption

