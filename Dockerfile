FROM alpine:3.6
COPY files /home/install
RUN apk add --update php7 php7-xml php7-pdo php7-openssl php7-zip php7-mbstring php7-pcntl php7-posix sqlite  php7-xmlwriter \
            php7-sockets php7-gettext php7-iconv php7-pdo_pgsql php7-pdo_mysql php7-zlib php7-dom php7-pdo_sqlite \
            php7-soap php7-bz2 php7-json php7-phar php7-ctype php7-gd php7-bcmath php7-curl git php7-tokenizer && \
     sh /home/install/config.sh && composer config -g repo.packagist composer https://packagist.phpcomposer.com && \
     composer self-update && \
     rm -rf /home/install && \
     rm -rf /var/cache/apk/*
WORKDIR /home
CMD php -v