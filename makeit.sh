#!/bin/bash

rm -R env | echo -n

python3 -m pip install -t env ./nspace-three ./nspace-two

PYTHONPATH=nspace-two:env python3 -c 'import nspace.two.stuff'
