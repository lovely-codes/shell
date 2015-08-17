#!/bin/sh

user=""
name=""

git clone https://github.com/$user/$name.git
cd $name

python setup.py install
