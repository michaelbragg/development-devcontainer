ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm-alpine

ARG USER_ID
ARG GROUP_ID
ARG XDEBUG_ENABLE

# Composer
COPY --from=composer:2.2.7 /usr/bin/composer /usr/local/bin/composer

# persistent dependencies
RUN apk add --no-cache \
# in theory, docker-entrypoint.sh is POSIX-compliant, but priority is a working, consistent image
		bash \
# BusyBox sed is not sufficient for some of our sed expressions
		sed \
# Install Git for use with Composer
		git \
	;
