#!/bin/bash -e
cd ~
wget http://www.cryptopp.com/cryptopp563.zip
unzip cryptopp563.zip -d cryptopp
cd cryptopp
sed -e s/march=native/march=i686/g GNUmakefile | sed -e s/-m64/-m32/g > tmp_make
mv tmp_make GNUmakefile
make static
make install
cd ~
rm -rf cryptopp*
