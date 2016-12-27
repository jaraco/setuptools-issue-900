from setuptools import setup

setup(
    name='nspace-two',
    version='1.0.0',
    packages=['nspace', 'nspace.two'],
    py_modules=['setup'],
    namespace_packages=['nspace'],
    install_requires=['nspace-three', 'setuptools==32.3.0', 'pip==9.0.1']
)
