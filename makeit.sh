#!/bin/bash

rm -R env | echo -n

pip install -t env ./nspace-three ./nspace-two

PYTHONPATH=nspace-two:env python3 -c 'import nspace.two.stuff'
