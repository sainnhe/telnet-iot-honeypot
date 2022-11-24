FROM sainnhe/telnet-iot-honeypot:base

# Config
RUN \
    cd /root/telnet-iot-honeypot \
    && git remote set-url origin https://github.com/sainnhe/telnet-iot-honeypot.git \
    && git pull origin master \
    && cat config.yaml >> config.dist.yaml \
    && rm config.yaml

# Http Server
RUN \
    sed -i 's/mirrors.tuna.tsinghua.edu.cn/mirrors.aliyun.com/' /etc/apt/sources.list \
    && apt update && apt install -y lighttpd \
    && cd /root/telnet-iot-honeypot \
    && cp -R html /var/www \
    && chown www-data:www-data /var/www -R

# Clean
RUN \
    rm -rf /tmp/*

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "/usr/bin/python", "honeypot.py" ]
WORKDIR /root/telnet-iot-honeypot
EXPOSE 2323 80
