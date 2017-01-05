#!/bin/bash

rm -R env | echo -n

python3 -m virtualenv env

env/bin/pip install ./nspace-three ./nspace-two

PYTHONPATH=nspace-two env/bin/python -c 'import nspace.two.stuff'
