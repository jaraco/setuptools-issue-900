# setuptools-namespaces
Reproducing a bug

This is, I think, a corner case triggering a bug in setuptools related to namespace packages.

Run ./makeit.sh to see it break on py35 (you need tox)

The bug can be bypassed in two ways:
 - by getting tox to chdir out of nspace-two directory before it runs the imports
 - by commenting out the "import pkg_resources" in nspace-two/nspace/two/stuff.py
