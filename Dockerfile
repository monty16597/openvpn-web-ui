FROM debian:jessie
WORKDIR /opt
EXPOSE 8080

RUN apt-get update && apt-get install -y easy-rsa
RUN chmod 755 /usr/share/easy-rsa/*
ADD build/assets/start.sh /opt/start.sh
ADD build/assets/generate_ca_and_server_certs.sh /opt/scripts/generate_ca_and_server_certs.sh
ADD build/assets/vars.template /opt/scripts/

ADD openvpn-web-ui.tar.gz /opt/openvpn-gui/
RUN rm -f /opt/openvpn-gui/data.db
ADD build/assets/app.conf /opt/openvpn-gui/conf/app.conf

CMD /opt/start.sh
