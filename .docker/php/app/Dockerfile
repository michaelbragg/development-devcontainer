ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm-alpine
# FROM php:8.0-fpm-alpine

ARG USER_ID
ARG GROUP_ID
ARG XDEBUG_ENABLE

# persistent dependencies
RUN apk add --no-cache \
# in theory, docker-entrypoint.sh is POSIX-compliant, but priority is a working, consistent image
		bash \
# BusyBox sed is not sufficient for some of our sed expressions
		sed \
# Ghostscript is required for rendering PDF previews
		ghostscript \
# Alpine package for "imagemagick" contains ~120 .so files, see: https://github.com/docker-library/wordpress/pull/497
		imagemagick \
# MSMTP
		msmtp

# install the PHP extensions we need (https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions)
RUN set -ex; \
	\
	apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
		freetype-dev \
		imagemagick-dev \
		icu-dev \
		libjpeg-turbo-dev \
		libpng-dev \
		libwebp-dev \
		libzip-dev \
	; \
	\
	docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp; \
	docker-php-ext-configure zip; \
	docker-php-ext-install -j "$(nproc)" \
		bcmath \
		exif \
		gd \
		intl \
		mysqli \
		zip \
	; \
# WARNING: imagick is likely not supported on Alpine: https://github.com/Imagick/imagick/issues/328
# https://pecl.php.net/package/imagick
	pecl install imagick-3.6.0; \
	docker-php-ext-enable imagick; \
	rm -r /tmp/pear; \
	\
	pecl install igbinary \
	docker-php-ext-igbinary \
	pecl install redis \
	docker-php-ext-enable redis \
	[ "${XDEBUG_ENABLE:-false}" = true ] && pecl install xdebug && docker-php-ext-enable xdebug; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --virtual .wordpress-phpexts-rundeps $runDeps; \
	apk del .build-deps

## Setup PHP.ini
COPY ./php/php.ini /usr/local/etc/php/php.ini

## Install MSMTP for Sendmail
COPY ./.shared/msmtprc /etc/msmtprc
RUN chmod 644 /etc/msmtprc
COPY ./php/conf.d/99-sendmail.conf /usr/local/etc/php/conf.d/mail.ini
COPY ./php/conf.d/*.ini /usr/local/etc/php/conf.d/
