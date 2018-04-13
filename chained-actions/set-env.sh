#!/bin/bash
rm -rf /root/projects
export OPENWHISK_HOME="${HOME}/openwhisk"
mkdir -p $OPENWHISK_HOME/bin
mkdir -p ~/root/projects/chaining

wget https://github.com/apache/incubator-openwhisk-cli/releases/download/latest/OpenWhisk_CLI-latest-linux-386.tgz
tar -zxf OpenWhisk_CLI-latest-linux-386.tgz -C $OPENWHISK_HOME/bin

until $(oc status &> /dev/null); do sleep 1; done; oc adm policy add-cluster-role-to-user cluster-admin admin
oc new-project faas --display-name="FaaS - Apache OpenWhisk"

export PATH="${OPENWHISK_HOME}/bin:${PATH}"