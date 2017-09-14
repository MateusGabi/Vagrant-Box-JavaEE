#!/bin/bash

export VAGRANT_DIR="/vagrant"

export VAGRANT_SCRIPTS_DIR="$VAGRANT_DIR/vagrant"
export VAGRANT_PROVISION_SCRIPTS_DIR="$VAGRANT_SCRIPTS_DIR/provision"
export VAGRANT_CONFIG_FILES_DIR="$VAGRANT_SCRIPTS_DIR/config"

chmod -R 755 $VAGRANT_SCRIPTS_DIR

# credenciais do superusuario pro postgre da maquina virtual
export DATABASE_USER='dev'
export DATABASE_PASSWORD='dev123'

# configurando locale
su -c "sh $VAGRANT_PROVISION_SCRIPTS_DIR/locale.sh"

# instalar pacotes utilitarios para auxiliar o desenvolvedor
sh "$VAGRANT_PROVISION_SCRIPTS_DIR/utils.sh"

# instalando postgresql
sh "$VAGRANT_PROVISION_SCRIPTS_DIR/postgresql.sh"

# servidor apache
sh "$VAGRANT_PROVISION_SCRIPTS_DIR/apache2.sh"

# servidor tomcat
sh "$VAGRANT_PROVISION_SCRIPTS_DIR/tomcat.sh"

# mailcatcher
sh "$VAGRANT_PROVISION_SCRIPTS_DIR/mailcatcher.sh"

echo 'reiniciando apache2'
sudo service apache2 restart

echo 'reiniciando tomcat'
bash /opt/tomcat9/bin/startup.sh

echo 'reiniciando postgresql'
sudo service postgresql restart
