#!/bin/bash -e
cd /etc/yum.repos.d
wget http://people.centos.org/tru/devtools-2/devtools-2.repo
yum install -y devtoolset-2-gcc-c++ devtoolset-2-binutils devtoolset-2-libquadmath-devel; yum clean all -y
