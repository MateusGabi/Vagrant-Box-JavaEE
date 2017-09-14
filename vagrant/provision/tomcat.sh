#!/bin/bash

echo 'Instalando Tomcat'

sudo apt-get install tomcat7

sudo service tomcat7 start

sudo /sbin/iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080

echo $CATALINA_HOME

echo $JAVA_HOME

# # [a partir de agora foi seguido este tutorial http://tecadmin.net/install-tomcat-9-on-ubuntu/]
# cd /opt
#
# # O arquivo compactado será baixado. Tomcat versão 9.0.0.M26
# sudo wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-9/v9.0.0.M26/bin/apache-tomcat-9.0.0.M26.tar.gz
#
# # Este comando irá descompactar o arquivo. Após isso, é necessário mover o arquivo para uma pasta chamada tomcat9
# sudo tar xzf /opt/apache-tomcat-9.0.0.M13.tar.gz
#
# sudo mv /opt/apache-tomcat-9.0.0.M1 /opt/tomcat9
#
# # Agora precisamos configurar as variáveis de ambiente…
#
# sudo echo "export CATALINA_HOME="/opt/tomcat9"" >> /etc/environment
# sudo echo "export JAVA_HOME="/usr/lib/jvm/java-8-oracle"" >> /etc/environment
# sudo echo "export JRE_HOME="/usr/lib/jvm/java-8-oracle/jre"" >> /etc/environment
# sudo source ~/.bashrc
#
# sudo sh /opt/tomcat9/bin/startup.sh
