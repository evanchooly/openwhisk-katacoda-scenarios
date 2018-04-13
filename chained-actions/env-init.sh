ssh root@host01 <<EOF
yum -y install wget tree
until $(oc status &> /dev/null); do sleep 1; done; oc adm policy add-cluster-role-to-user cluster-admin admin
oc new-project faas --display-name="FaaS - Apache OpenWhisk"
EOF
