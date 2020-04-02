#!/bin/bash

PROTOC_VER=3.7.1
PROTOC_ZIP_URL=https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VER}/protoc-${PROTOC_VER}-linux-x86_64.zip
INSTALL_BASE_DIR=~/usr/local/protoc-${PROTOC_VER}/
INSTALL_BIN=~/usr/local/protoc-${PROTOC_VER}/bin/
INSTALL_INCLUDE=~/usr/local/protoc-${PROTOC_VER}/include/
EXTRACT_DEST=./temp/

# clean up
rm -rf ${INSTALL_BASE_DIR}

# download
curl -L ${PROTOC_ZIP_URL} -o protoc.zip

# directory initialize
mkdir -p ${INSTALL_BIN}
mkdir -p ${INSTALL_INCLUDE}

# file copy
unzip protoc.zip -d ${EXTRACT_DEST}
cp -pr ${EXTRACT_DEST}bin/* ${INSTALL_BIN}
cp -pr ${EXTRACT_DEST}/include/* ${INSTALL_INCLUDE}

# cleanup
rm -rf ${EXTRACT_DEST}
rm -f ./protoc.zip

# setup bashrc
echo '# for home directory install commands' >> ~/.bashrc
echo "export PATH=\$PATH:\$HOME/usr/local/protoc-${PROTOC_VER}/bin" >> ~/.bashrc
echo "export LD_LIBLARY_PATH=\$HOME/usr/local/protoc-${PROTOC_VER}/include" >> ~/.bashrc

