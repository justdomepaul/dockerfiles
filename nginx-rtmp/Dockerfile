FROM alpine:latest

RUN	apk update		&&	\
	apk add				\
		openssl			\
		libstdc++		\
		ca-certificates		\
		pcre

RUN	mkdir -p /tmp/hls
ADD	nginx.tar.gz /opt/

EXPOSE 80
EXPOSE 1935

CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
