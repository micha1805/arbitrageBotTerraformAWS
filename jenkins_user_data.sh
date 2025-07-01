#!/bin/bash

set -e

# Update system
yum update -y

# Install Java 17
yum install -y java-17-amazon-corretto

# Install Git
yum install -y git

# Install Docker
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

# Install Maven
yum install -y maven

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
yum install -y unzip
unzip awscliv2.zip
./aws/install

# Install required fonts for Jenkins charts
yum install -y fontconfig dejavu-sans-fonts

# Add Jenkins repository
curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
yum install jenkins -y

# Ajouter jenkins au groupe docker
usermod -aG docker jenkins

# Configure Jenkins
mkdir -p /etc/sysconfig
cat > /etc/sysconfig/jenkins << 'EOL'
JENKINS_HOME=/var/lib/jenkins
JENKINS_USER=jenkins
JENKINS_JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto
JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Djenkins.install.runSetupWizard=true -Djenkins.model.Jenkins.slaveAgentPort=50000 -Djenkins.model.Jenkins.slaveAgentPortEnforce=true -Djenkins.model.Jenkins.rootUrl=${JENKINS_URL}"
EOL

# Permissions
chown -R jenkins:jenkins /var/lib/jenkins
chmod -R 755 /var/lib/jenkins
chown jenkins:jenkins /etc/sysconfig/jenkins

# Start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Wait for Jenkins to start
sleep 30