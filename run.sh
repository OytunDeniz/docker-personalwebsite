#!/bin/bash 

wget -O /tmp/personalwebsite.zip \
    https://github.com/OytunDeniz/personalwebsite/archive/refs/heads/main.zip


unzip /tmp/personalwebsite.zip -d /tmp/ && \
    npm --prefix /tmp/personalwebsite-main install && \
    npm --prefix /tmp/personalwebsite-main run build && \
    mkdir /var/www/personalwebsite && \
    cp -r /tmp/personalwebsite-main/build/* /var/www/personalwebsite/ && \
    chown -R www-data:www-data /var/www/ && \
    rm -rf /tmp/per*


service nginx start && tail -f /var/log/nginx/error.log
