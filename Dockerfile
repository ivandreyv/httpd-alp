FROM alpine:3.12
#ivandreyv/httpd-alp
RUN	apk update --no-cache && apk upgrade -U -a && apk add --no-cache tzdata apache2 apache2-ssl && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
	ln -sf /dev/stderr /var/log/apache2/error.log && \
	ln -sf /dev/stdout /var/log/apache2/ssl_access.log && \
	ln -sf /dev/stderr /var/log/apache2/ssl_error.log


CMD ["httpd","-D","FOREGROUND","-k","start"]

HEALTHCHECK --start-period=15s --interval=10s --timeout=3s --retries=2    CMD pgrep httpd

