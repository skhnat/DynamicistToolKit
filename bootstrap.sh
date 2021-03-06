#!/usr/bin/env bash

# This works for Ubuntu 13.10, Saucy Salamander.

apt-get update
# installation
apt-get install -y python-setuptools
# main dependencies
apt-get install -y python-numpy python-scipy python-matplotlib python-pandas
# testing
apt-get install -y python-nose python-coverage
# documentation
apt-get install -y python-sphinx python-numpydoc

# Test and install current branch stored on local machine with the VM
cd /vagrant
nosetests -v --with-coverage --cover-package=dtk
python setup.py install
cd docs
make html

# Test and install HEAD of master branch pulled from Github
apt-get install -y git
cd $HOME
git clone https://github.com/moorepants/DynamicistToolKit.git
cd DynamicistToolKit
nosetests -v --with-coverage --cover-package=dtk
python setup.py install
cd docs
make html
