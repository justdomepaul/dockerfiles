FROM alpine:latest

RUN	apk update		&&	\
	apk add				\
		git			\
		gcc			\
		binutils-libs		\
		binutils		\
		gmp			\
		isl			\
		libgomp			\
		libatomic		\
		libgcc			\
		openssl			\
		pkgconf			\
		pkgconfig		\
		mpfr3			\
		mpc1			\
		libstdc++		\
		ca-certificates		\
		libssh2			\
		curl			\
		expat			\
		pcre			\
		musl-dev		\
		libc-dev		\
		pcre-dev		\
		zlib-dev		\
		openssl-dev		\
		make


RUN	cd /tmp/									&&	\
	wget http://nginx.org/download/nginx-1.9.11.tar.gz				&&	\
	git clone https://github.com/arut/nginx-rtmp-module.git

RUN	cd /tmp										&&	\
	tar xzf nginx-1.9.11.tar.gz							&&	\
	cd nginx-1.9.11									&&	\
	./configure										\
		--prefix=/opt/nginx								\
		--with-http_ssl_module								\
		--add-module=../nginx-rtmp-module					&&	\
	make										&&	\
	make install

COPY	nginx.conf /opt/nginx/conf/nginx.conf
RUN	mkdir -p /opt/nginx/rtmp
COPY	stat.xsl /opt/nginx/rtmp/stat.xsl

RUN	cd /opt/ 	&&	\
	tar cvzf /tmp/nginx.tar.gz nginx

EXPOSE 1935

CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]

