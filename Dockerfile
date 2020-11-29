FROM centos:centos8

RUN yum install -y epel-release && yum update -y && dnf install -y dnf-plugins-core;

RUN yum install -y supervisor bash-completion net-tools vim && \
mkdir /run/supervisor;

RUN yum install -y httpd mod_ssl && \
/usr/libexec/httpd-ssl-gencerts;

RUN dnf module enable -y nodejs:12 && \
dnf install -y nodejs;

RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm && \
dnf module enable -y php:remi-7.4 && \
dnf config-manager --set-enabled remi && \
dnf install -y ca-certificates curl git ImageMagick php php-apcu php-cli php-common php-ctype php-curl php-dom php-exif php-fileinfo php-fpm php-gd php-gettext php-iconv php-intl php-json php-ldap php-mbstring php-memcached php-openssl php-pdo php-pdo_mysql php-mysqlnd php-pear php-pecl-apcu php-pecl-memcache php-pecl-mongodb php-pecl-xdebug php-pgsql php-phar php-PHPMailer php-simplexml php-sqlite3 php-tokenizer php-xml php-xmlreader php-xmlwriter php-zip sqlite tzdata php-oci8 libnotify php-opcache;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
php composer-setup.php --install-dir=bin --filename=composer && \
php -r "unlink('composer-setup.php');";

CMD ["/scripts/start.sh"]
