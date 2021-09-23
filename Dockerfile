FROM alpine:edge
LABEL MAINTAINER="Master-Hun"

## skip apk SSL error on apline:edge
RUN sed 's/https/http/g' -i /etc/apk/repositories

RUN apk --no-cache update
RUN apk --no-cache upgrade

## install apache2 & basic
RUN apk add apache2 curl bash libcurl
## install php 7 fpm  
RUN apk add php7 php7-fpm php7-opcache
## install php 7.x ext module 
RUN apk add php7-apache2 php7-mbstring php7-session php7-json php7-pdo php7-openssl php7-tokenizer php7-pdo_mysql php7-xml php7-simplexml
RUN apk add php7-common php7-gd php7-cli php7-mysqli php7-zlib php7-curl php7-iconv php7-mysqlnd php7-dom php7-ctype php7-phar php7-intl

## copy changed configure file httpd.conf & php.ini
COPY ./config/httpd.conf /etc/apache2/httpd.conf
COPY ./config/php.ini /etc/php7/php.ini

## move DOCUMENT_ROOT
WORKDIR /var/www/localhost/htdocs
## COPY now version (mount your volume when development)
COPY ./src ./

## modify permission, if you not use this line, see the oops! page
RUN chmod -R 777 /var/www/localhost/htdocs/writable/cache

## port
EXPOSE 80
ENV TZ=Asia/Seoul

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]