#!/usr/bin/env bash
set -e


echo "Install Java 8........"
sudo apt-get purge openjdk-\*  > /dev/null
sudo apt-get install -y python-software-properties  > /dev/null
sudo add-apt-repository -y ppa:webupd8team/java  > /dev/null
sudo apt-get update -y
# auto accept oracle jdk license
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer -y  > /dev/null
sudo apt-get install oracle-java8-set-default -y  > /dev/null
java -version
export JAVA_HOME="/usr/lib/jvm/java-8-oracle/"
export PATH=$JAVA_HOME/bin:$PATH
echo "Set JAVA_HOME to" $JAVA_HOME
sudo ln -s /usr/lib/jvm/java-8-oracle /usr/lib/jvm/default-java | true
