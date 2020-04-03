#!/bin/bash

PROTOC_GEN_GRPC_WEB=1.0.7
PROTOC_GEN_GRPC_WEB_BIN_URL=https://github.com/grpc/grpc-web/releases/download/${PROTOC_GEN_GRPC_WEB}/protoc-gen-grpc-web-${PROTOC_GEN_GRPC_WEB}-linux-x86_64
INSTALL_BASE_DIR=~/usr/local/protoc-gen-grpc-web-${PROTOC_GEN_GRPC_WEB}/
INSTALL_BIN=~/usr/local/protoc-gen-grpc-web-${PROTOC_GEN_GRPC_WEB}/bin/
EXTRACT_DEST=./temp/

# clean up
rm -rf ${INSTALL_BASE_DIR}

# download
curl -L ${PROTOC_GEN_GRPC_WEB_BIN_URL} -o protoc-gen-grpc-web

# directory initialize
mkdir -p ${INSTALL_BIN}

# file copy
chmod 755 ./protoc-gen-grpc-web
cp -pf ./protoc-gen-grpc-web ${INSTALL_BIN}

# cleanup
rm -f ./protoc-gen-grpc-web

# setup bashrc
echo '# for home directory install grpc-web-proto-gen' >> ~/.bashrc
echo "export PATH=\$PATH:\$HOME/usr/local/protoc-gen-grpc-web-${PROTOC_GEN_GRPC_WEB}/bin" >> ~/.bashrc

