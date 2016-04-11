#!/bin/bash
source "/vagrant/scripts/common.sh"

function installMongo {
	rpm --import https://www.mongodb.org/static/pgp/server-3.2.asc
	cat > /etc/yum.repos.d/mongodb.repo <<-EOF 
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/i686/
gpgcheck=0
enabled=1
EOF
	yum install mongo-10gen mongo-10gen-server
}

function startMongo {
	service mongod start
}

function installHadoopMongo {
	cp /vagrant/jars/mongo-hadoop-spark-1.5.2.jar /usr/local/spark/bin
}

function installPyMongo {
	yum install -y gcc python-devel
	wget https://bootstrap.pypa.io/ez_setup.py -O - | python
	easy_install pymongo
}


echo "Installing mongo db with yum"
installMongo
startMongo
installHadoopMongo
installPyMongo