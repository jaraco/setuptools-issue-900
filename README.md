# setuptools-namespaces
Reproducing a bug

This is, I think, a corner case triggering a bug in setuptools related to namespace packages.

Run ./makeit.sh to see it break on py35

The bug can be bypassed in two ways:
 - by chdir-ing out of nspace-two directory before you run the imports
 - by commenting out the "import pkg_resources" in nspace-two/nspace/two/stuff.py
