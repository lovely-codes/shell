#!/bin/sh

d=$(pwd)

git clone https://github.com/python-greenlet/greenlet.git
cd greenlet
python setup.py install

cd $d 
git clone https://github.com/eventlet/eventlet.git
cd eventlet/
python setup.py install
