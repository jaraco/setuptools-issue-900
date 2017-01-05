from setuptools import setup

setup(
    name='nspace-two',
    version='1.0.0',
    packages=['nspace', 'nspace.two'],
    namespace_packages=['nspace'],
    install_requires=['nspace-three']
)
