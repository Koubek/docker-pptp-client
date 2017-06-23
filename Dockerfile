FROM ubuntu:14.04
LABEL maintainer "Jakub Vanak"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq; \
    apt-get install -qqy iproute iptables iputils-ping nano net-tools pptpd rsyslog 

COPY start.sh /start.sh
RUN chmod u+x /start.sh

ENTRYPOINT ["/start.sh"]
