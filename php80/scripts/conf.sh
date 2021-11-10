#!/bin/bash
#mkdir -p /etc/httpd/conf
rsync -aP /etc/httpd/conf /scripts/conf/httpd/
#mkdir -p /etc/httpd/conf.d
rsync -aP /etc/httpd/conf.d /scripts/conf/httpd/
#mkdir -p /etc/httpd/conf.modules.d
rsync -aP /etc/httpd/conf.modules.d /scripts/conf/httpd/
#mkdir -p /etc/php/php.d
rsync -aP /etc/php.d /scripts/conf/php/
#mkdir -p /etc/php/php-zts.d
rsync -aP /etc/php-zts.d /scripts/conf/php/
#mkdir -p /etc/php/php-fpm.d
rsync -aP /etc/php-fpm.d /scripts/conf/php/