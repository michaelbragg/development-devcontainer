FROM nginx:1.18.0
COPY ./nginx/conf.d/php.conf /etc/nginx/conf.d/default.conf
