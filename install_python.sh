#!/bin/bash

curl -o python-3.tar.xz  https://www.python.org/ftp/python/3.4.6/Python-3.4.6.tar.xz
tar -xf python-3.tar.xz
cd Python-3.4.6

./configure --enable-optimizations --with-lto
make -j 8
make install
