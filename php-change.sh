#!/bin/bash

actual=$(php --version | head -n 1 | cut -d " " -f 2 | cut -c 1,2,3);
activate=$1;


echo 'DEAKTYWUJE';
echo $actual;

echo 'AKTYWUJE';
echo $activate;

echo 'podmieniam simlink';
sudo update-alternatives --set php /usr/bin/php$activate

echo 'deaktywacja';

sudo a2dismod php$actual;
sudo service apache2 restart; 
sudo a2enmod php$activate;
sudo service apache2 restart; 


echo 'Aktualna wersja php: ';
php -v;