#!/bin/sh

if [ -z $MYSQL_DATABASE ]; then
	MYSQL_DATABASE="postfix"
fi

if [ -z $MYSQL_USER ]; then
	MYSQL_USER="root"
fi

if [ -z $MYSQL_PASSWORD ]; then
	MYSQL_PASSWORD="root"
fi

if [ -z $MYSQL_HOST ]; then
	MYSQL_HOST="database:3306"
fi

export fic="/var/www/html/config.inc.php"
sed -i "s/@@MYSQL_DATABASE@@/$MYSQL_DATABASE/g" $fic
sed -i "s/@@MYSQL_USER@@/$MYSQL_USER/g" $fic
sed -i "s/@@MYSQL_HOST@@/$MYSQL_HOST/g" $fic
sed -i "s/@@MYSQL_PASSWORD@@/$MYSQL_PASSWORD/g" $fic
sed -i "s/\$CONF..configured.. = false;/\$CONF['configured'] = true;/g" $fic 

mkdir /var/www/html/templates_c
chmod 777 /var/www/html/templates_c

php-fpm
