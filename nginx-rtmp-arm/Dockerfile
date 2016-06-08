FROM resin/rpi-raspbian:jessie

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y --force-yes openssl ca-certificates libpcre3

RUN	mkdir -p /tmp/hls
ADD	nginx.tar.gz /opt/

EXPOSE 80
EXPOSE 1935

CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
