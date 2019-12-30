FROM alpine
RUN apk add --update php7 php7-xml php7-pdo php7-openssl php7-zip php7-mbstring php7-pcntl php7-posix sqlite  php7-xmlwriter \
            php7-sockets php7-gettext php7-iconv php7-pdo_pgsql php7-pdo_mysql php7-session php7-zlib php7-dom php7-pdo_sqlite php7-fileinfo \
            php7-soap php7-bz2 php7-json php7-phar php7-ctype php7-gd php7-bcmath php7-curl git php7-tokenizer php7-simplexml curl && \
     rm -rf /var/cache/apk/* && \
     sed -i "s/max_execution_time = 30/max_execution_time = 300/g" /etc/php7/php.ini && \
     sed -i "s/post_max_size = 8M/post_max_size = 10000M/g" /etc/php7/php.ini && \
     sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 10000M/g" /etc/php7/php.ini && \
     sed -i "s/expose_php = On/expose_php = Off/g" /etc/php7/php.ini && \
     curl -s https://getcomposer.org/installer | php && \
     mv composer.phar /bin/composer
WORKDIR /home
CMD php -v
