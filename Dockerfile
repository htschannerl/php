FROM centos:centos8

RUN yum install -y httpd mod_ssl;

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
yum install -y nodejs;

RUN npm install -g npm && \
npm install --global gulp && \
npm install --global gulp-cli && \
npm install --global notify-send;

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
yum-config-manager --enable remi-php73 && \
yum install -y ca-certificates curl git ImageMagick libcurl3 libcurl3-dev php php-apcu php-cli php-common php-ctype php-curl php-dom php-exif php-fileinfo php-fpm php-gd php-gettext php-iconv php-intl php-json php-ldap php-mbstring php-memcached php-openssl php-pdo php-pdo_mysql php-mysqlnd php-pear php-pear-HTTP-Request2 php-pecl-apcu php-pecl-memcache php-pecl-mongodb php-pecl-xdebug php-pgsql php-phar php-PHPMailer.noarch php-simplexml php-sqlite3 php-tokenizer php-xml php-xmlreader php-xmlwriter php-zip sqlite tzdata php-oci8 libnotify php-opcache;

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
php composer-setup.php --install-dir=bin --filename=composer && \
php -r "unlink('composer-setup.php');";