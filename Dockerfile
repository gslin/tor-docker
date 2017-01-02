# Command:
# docker run -p 127.0.0.1:9050:9050 -d gslin/tor
#
FROM debian:jessie
MAINTAINER gslin@gslin.org
RUN gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 && \
    gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add - && \
    echo "deb http://deb.torproject.org/torproject.org jessie main" | tee /etc/apt/sources.list.d/tor.list && \
    echo "deb-src http://deb.torproject.org/torproject.org jessie main" | tee -a /etc/apt/sources.list.d/tor.list && \
    sed -i -e 's/deb.debian.org/httpredir.debian.org/g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y deb.torproject.org-keyring tor && \
    apt-get clean && \
    echo "SOCKSPort 0.0.0.0:9050" | tee -a /etc/tor/torrc
EXPOSE 9050
ENTRYPOINT ["/usr/sbin/tor"]
