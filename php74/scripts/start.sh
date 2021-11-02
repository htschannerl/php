#!/bin/bash
httpconf=/scripts/conf/httpd/conf.d
phpconf=/scripts/conf/php/php.d
phpfpmconf=/scripts/conf/php/php-fpm.d
supervisord=/scripts/conf/supervisord/supervisord.d
html=/scripts/html
for entry in `ls "$httpconf"`
do
    file=/etc/httpd/conf.d/"$entry"
    if [ ! -f "${file}" ]; then
        mkdir -p /etc/httpd/conf.d/
        cp "$httpconf"/"$entry" "$file"
        echo "$entry"
    fi
done

for entry in `ls "$phpconf"`
do
    file=/etc/php.d/"$entry"
    if [ ! -f "${file}" ]; then
        mkdir -p /etc/php.d/
        cp "$phpconf"/"$entry" "$file"
        echo "$entry"
    fi
done

for entry in `ls "$phpfpmconf"`
do
    file=/etc/php-fpm.d/"$entry"
    if [ ! -f "${file}" ]; then
        mkdir -p /etc/php-fpm.d/
        cp "$phpfpmconf"/"$entry" "$file"
        echo "$entry"
    fi
done

for entry in `ls "$supervisord"`
do
    file=/etc/supervisord.d/"$entry"
    if [ ! -f "${file}" ]; then
        mkdir -p /etc/supervisord.d/
        cp "$supervisord"/"$entry" "$file"
        echo "$entry"
    fi
done

mkdir -p /var/www/html
for entry in `ls "$html"`
do
    file=/var/www/html/"$entry"
    if [ ! -f "${file}" ]; then
        cp "$html"/"$entry" "$file"
        echo "$entry"
    fi
done
/usr/bin/unlink /run/supervisor/supervisor.sock
/usr/bin/supervisord -c /etc/supervisord.conf