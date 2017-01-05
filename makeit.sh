#!/bin/bash -e

find ~/.cache/pip/wheels/ -name '*nspace*' | xargs rm -f
mkdir -p ~/nspace-dist
rm -f  ~/nspace-dist/*
rm -rf /tmp/testvenv

if [ ! -f ~/.pip/pip.conf ] || ! grep -q nspace-dist ~/.pip/pip.conf ; then
  echo 'For this to work, create ~/.pip/pip.conf with the line:'
  echo '[global]'
  echo 'find-links = /home/vagrant/nspace-dist'
  exit 1
fi

(cd nspace-two; python setup.py sdist -d ~/nspace-dist)
(cd nspace-three; python setup.py sdist -d ~/nspace-dist)

(
 virtualenv -p $(which python3) /tmp/testvenv 
 source /tmp/testvenv/bin/activate
 pip install ~/nspace-dist/nspace-two-1.0.0.tar.gz
 set -x
 cd nspace-two
 python -c 'from nspace.three.morestuff import *'  # Always works
 python -c 'from nspace.two.stuff import *'        # Breaks on 3.5
)
