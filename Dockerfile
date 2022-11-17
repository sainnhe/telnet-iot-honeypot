FROM sainnhe/telnet-iot-honeypot:base

# Config
RUN \
    cat /root/telnet-iot-honeypot/config.yaml >> /root/telnet-iot-honeypot/config.dist.yaml \
    && rm /root/telnet-iot-honeypot/config.yaml

# Http Server
RUN \
    apt update && apt install -y lighttpd \
    && cd /root/telnet-iot-honeypot \
    && cp -R html /var/www \
    && chown www-data:www-data /var/www -R

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "/usr/bin/python", "honeypot.py" ]
WORKDIR /root/telnet-iot-honeypot
EXPOSE 2323 80
