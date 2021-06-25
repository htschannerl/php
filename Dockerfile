FROM centos:centos8

RUN dnf install -y epel-release && dnf update -y && dnf install -y dnf-plugins-core;

RUN dnf install -y supervisor bash-completion net-tools vim libnsl;

RUN dnf install -y httpd mod_ssl && \
/usr/libexec/httpd-ssl-gencerts;

RUN dnf module enable -y nodejs:12 && \
dnf install -y nodejs;

ADD scripts /scripts/

RUN dnf install -y /scripts/oracle*

ENV ORACLE_HOME=/usr/lib/oracle/19.8/client64
ENV PATH=$PATH:$ORACLE_HOME/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/oracle/19.8/client64/lib/
ENV TNS_ADMIN=$ORACLE_HOME/network/admin
ENV NLS_LANG=AMERICAN_AMERICA.TH8TISASCII

RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
dnf module enable -y php:remi-7.4 && \
dnf config-manager --set-enabled remi && \
dnf install -y ca-certificates curl git ImageMagick php php-apcu php-cli php-common php-ctype php-curl php-dom php-exif php-fileinfo php-gd php-gettext php-iconv php-intl php-json php-ldap php-mbstring php-memcached php-openssl php-pdo php-pdo_mysql php-mysqlnd php-pear php-pecl-apcu php-pecl-memcache php-pecl-mongodb php-pecl-xdebug php-pgsql php-phar php-PHPMailer php-simplexml php-sqlite3 php-tokenizer php-xml php-xmlreader php-xmlwriter php-zip sqlite tzdata php-oci8 libnotify php-opcache;

RUN mkdir /run/php-fpm && \
chmod 755 /run/php-fpm;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
php composer-setup.php --install-dir=bin --filename=composer && \
php -r "unlink('composer-setup.php');";

CMD ["/scripts/start.sh"]
