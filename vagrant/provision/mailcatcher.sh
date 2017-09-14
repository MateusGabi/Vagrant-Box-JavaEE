#!/bin/bash

echo 'instalando mailcatcher'

# Update repositories
apt-get update

# Install Basics
# build-essential needed for "make" command
apt-get install -y build-essential software-properties-common \
                        vim curl wget tmux

# Install Mailcatcher Dependencies (sqlite, ruby)
# apt-get install -y libsqlite3-dev ruby2.2-dev ruby2.2
# curl -sSL https://get.rvm.io | bash -s stable

apt-add-repository ppa:brightbox/ruby-ng -y
apt-get update

apt-get install -y libsqlite3-dev

apt-get install -y ruby2.2 ruby2.2-dev

# Install Mailcatcher as a Ruby gem
gem install mailcatcher -v 0.5.12

gem install mime-types -v 2.6.2

# Add a cfg no php.ini pra ele enviar os e-mails para o Mailcatcher :)
echo "sendmail_path = /usr/bin/env $(which catchmail) -f dev@local.ledes.net"  >> /etc/php5/apache2/php.ini

# copia o arquivo de serviço pro diretório correto
cp $VAGRANT_CONFIG_FILES_DIR/mailcatcher.conf /etc/init/mailcatcher.conf

# startat o servico do catcher
sudo service mailcatcher start

sudo service apache2 restart

echo 'instalado mailcatcher'
