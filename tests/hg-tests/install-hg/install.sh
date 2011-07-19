#!/bin/sh

aptitude purge commit-tool
aptitude purge qct
aptitude purge hg

aptitude install python python-dev python-setuptools build-essential

if [ ! -f mercurial-1.5.1.tar.gz ]; then
  wget http://mercurial.selenic.com/release/mercurial-1.5.1.tar.gz
fi

rm -f /usr/bin/hg-ssh

if [ -d mercurial-1.5.1 ]; then
  rm -fr mercurial-1.5.1
fi
tar xvzf mercurial-1.5.1.tar.gz 
cd mercurial-1.5.1/
  make install PREFIX=/opt/thirdparty/os_cpu/Linux/x86_64/mercurial/1.5.1
  ln -s /opt/thirdparty/os_cpu/Linux/x86_64/mercurial/1.5.1 /opt/thirdparty/os_cpu/Linux/x86_64/mercurial/latest

  if [ -f /usr/bin/hg ]; then
    rm -f /usr/bin/hg
  fi
  ln -fs /opt/thirdparty/os_cpu/Linux/x86_64/mercurial/latest/bin/hg /usr/bin/hg
cd ..

wget http://bitbucket.org/alu/hgconfig/raw/tip/hgext/config.py
mv config.py /opt/thirdparty/os_cpu/Linux/x86_64/mercurial/1.5.1/lib/python2.6/site-packages/hgext/

# user config

echo "export PYTHONPATH=/opt/thirdparty/os_cpu/Linux/x86_64/mercurial/latest/lib/python2.6/site-packages:\${PYTHONPATH}" >> ~/.bashrc 

if [ ! -f ~/.hgrc ]; then
  cp hgrc.template ~/.hgrc
  chmod +w ~/.hgrc
  chown rbuck:rbuck /home/rbuck/.hgrc
fi

mkdir tmprepo
cd tmprepo
  hg init
  hg config --global ui.username "Full Name <full.name@company.com>"
cd ..
rm -fr tmprepo

