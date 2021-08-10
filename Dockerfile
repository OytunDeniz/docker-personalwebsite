#
FROM debian:buster-slim

LABEL maintainer="Oytun Deniz <oytun.deniz@gmail.com>" \
    name="personalwebsite" \
    version="1.0"


ENV HOME /root

ENV DEBIAN_FRONTEND noninteractive

# Configure Apt
ADD sources.list /etc/apt/sources.list


RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends nginx ca-certificates unzip wget vim curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \ 
    apt-get install -y nodejs && \
    apt-get clean

EXPOSE 80

VOLUME [ "/var/www" ]

ADD default /etc/nginx/sites-available

ADD run.sh /run/run.sh
RUN chmod +x /run/run.sh

ENV LC_ALL C.UTF-8
ENV TERM xterm

CMD ["/run/run.sh"]
