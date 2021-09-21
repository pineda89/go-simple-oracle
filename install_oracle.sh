#!/bin/bash

echo "TARGET: $TARGET"

if [ "$TARGET" != "MDH" ]
then
echo "Installing Oracle drivers ..."
# Install oracle packages
alien -i ./oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
alien -i ./oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
alien -i ./oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

echo "ORACLE :::::"
ls -la /usr/lib/oracle/12.1/client64/lib
ls -la /usr/lib/oracle/12.1/client64/bin

# Configure Oracle variables
echo "export ORACLE_HOME=/usr/lib/oracle/12.1/client64" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib" >> ~/.bashrc
echo "export TNS_ADMIN=$ORACLE_HOME/network/admin" >> ~/.bashrc
echo "export CGO_CFLAGS=-I/usr/include/oracle/12.1/client64" >> ~/.bashrc
echo "export CGO_LDFLAGS=-L/usr/lib/oracle/12.1/client64/lib" >> ~/.bashrc
source ~/.bashrc
fi
