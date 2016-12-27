#!/bin/bash -ex

find ~/.cache/pip/wheels/ -name '*nspace*' | xargs rm -f
rm ~/nspace-dist/*

(cd nspace-two; python setup.py sdist -d ~/nspace-dist)
(cd nspace-three; python setup.py sdist -d ~/nspace-dist)

(cd nspace-two; tox )
