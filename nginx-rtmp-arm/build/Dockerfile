FROM resin/rpi-raspbian:jessie

ENV NGINX_VERSION 1.9.12
ENV NGINX_RTMP_VERSION 1.1.7.10

ENV BUILDDEPS "autoconf automake gcc g++ libtool make nasm zlib1g-dev libssl-dev xz-utils cmake build-essential libpcre3-dev"

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y --force-yes curl git libpcre3 tar perl ca-certificates ${BUILDDEPS}

# nginx-rtmp
RUN DIR="$(mktemp -d)" && cd "${DIR}" && \
    curl -LOks "https://github.com/nginx/nginx/archive/release-${NGINX_VERSION}.tar.gz" && \
    tar xzvf "release-${NGINX_VERSION}.tar.gz" && \
    curl -LOks "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v${NGINX_RTMP_VERSION}.tar.gz" && \
    tar xzvf "v${NGINX_RTMP_VERSION}.tar.gz" && \
    cd "nginx-release-${NGINX_VERSION}" && \
    auto/configure \
        --prefix=/opt/nginx \
        --with-http_ssl_module \
        --add-module="../nginx-rtmp-module-${NGINX_RTMP_VERSION}" && \
    make -j"$(nproc)" && \
    make install && \
    rm -rf "${DIR}"


COPY	nginx.conf /opt/nginx/conf/nginx.conf
RUN	mkdir -p /opt/nginx/rtmp
COPY	stat.xsl /opt/nginx/rtmp/stat.xsl

RUN	cd /opt/ 	&&	\
	tar cvzf /tmp/nginx.tar.gz nginx

EXPOSE 1935

CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]

