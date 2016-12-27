#!/bin/bash -e

find ~/.cache/pip/wheels/ -name '*nspace*' | xargs rm -f
mkdir -p ~/nspace-dist
rm -f  ~/nspace-dist/*

if [ ! -f ~/.pip/pip.conf ] || ! grep -q nspace-dist ~/.pip/pip.conf ; then
  echo 'For this to work, create ~/.pip/pip.conf with the line:'
  echo '[global]'
  echo 'find-links = /home/vagrant/nspace-dist'
  exit 1
fi

(cd nspace-two; python setup.py sdist -d ~/nspace-dist)
(cd nspace-three; python setup.py sdist -d ~/nspace-dist)

(cd nspace-two; tox )
