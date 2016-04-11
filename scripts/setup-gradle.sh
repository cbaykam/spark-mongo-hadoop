#!/bin/bash
source "/vagrant/scripts/common.sh"

function installGradle {
	yum install -y unzip 
	gradle_version=2.9
	wget -Nq https://services.gradle.org/distributions/gradle-${gradle_version}-all.zip
	mkdir -p /opt/gradle
	unzip -oq gradle-${gradle_version}-all.zip
	ln -sfn /home/vagrant/gradle-${gradle_version} /opt/gradle/latest	
	cat > /etc/profile.d/gradle.sh <<-EOF 
export GRADLE_HOME=/opt/gradle/latest
export PATH=\$PATH:\$GRADLE_HOME/bin
EOF
    sh /etc/profile.d/gradle.sh
}

echo "Installing gradle"
installGradle