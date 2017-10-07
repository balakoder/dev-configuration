#!/usr/bin/env bash
set -e

echo "Installing jetty..........."
wget --quiet http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.2.6.v20141205.tar.gz  > /dev/null

tar -xvf jetty-distribution-9.2.6.v20141205.tar.gz
sudo rm -rf /opt/jetty/
sudo mv jetty-distribution-9.2.6.v20141205 /opt/jetty
sudo useradd jetty -U -s /bin/false
sudo chown -R jetty:jetty /opt/jetty/
sudo cp /opt/jetty/bin/jetty.sh /etc/init.d/jetty

rm -rf jetty-distribution-9.2.6.v20141205.tar.gz
sudo mkdir /opt/jetty/lib/logging 
cd /opt/jetty/lib/logging

sudo wget --quiet http://repo1.maven.org/maven2/org/slf4j/slf4j-log4j12/1.6.6/slf4j-log4j12-1.6.6.jar  > /dev/null
sudo wget --quiet http://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.6.6/slf4j-api-1.6.6.jar  > /dev/null
sudo wget --quiet http://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar  > /dev/null

if (grep -E "OPTIONS=.*logging.*" /opt/jetty/start.ini) 
then
    echo "Logging already present in /opt/jetty/start.ini"
else
    echo "Adding logging to /opt/jetty/start.ini"
    echo "" >> /opt/jetty/start.ini
    echo "# Adding lib/logging to server classpath" >> /opt/jetty/start.ini

cat << EOFL >> /opt/jetty/start.ini
# --------------------------------------- 
# Module: logging
--module=logging
## Logging Configuration
# Configure jetty logging for default internal behavior STDERR output
 -Dorg.eclipse.jetty.util.log.class=org.eclipse.jetty.util.log.StdErrLog

# Configure jetty logging for slf4j
 -Dorg.eclipse.jetty.util.log.class=org.eclipse.jetty.util.log.Slf4jLog

# Configure jetty logging for java.util.logging
# -Dorg.eclipse.jetty.util.log.class=org.eclipse.jetty.util.log.JavaUtilLog

# STDERR / STDOUT Logging
# Number of days to retain logs
 jetty.log.retain=10
# Directory for logging output
# Either a path relative to jetty.base or an absolute path
 jetty.logs=/opt/jetty/logs
# Overall Logging Level is INFO
org.eclipse.jetty.LEVEL=INFO
# Detail Logging for WebSocket
org.eclipse.jetty.websocket.LEVEL=DEBUG
EOFL
fi


