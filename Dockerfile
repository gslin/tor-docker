#
FROM debian:stretch-20181011
MAINTAINER gslin@gslin.org
COPY A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.publickey /tmp/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.publickey
RUN sed -i -e 's/deb.debian.org/httpredir.debian.org/g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y apt-transport-https gnupg && \
    apt-key add /tmp/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.publickey && \
    echo "deb https://deb.torproject.org/torproject.org stretch main" | tee /etc/apt/sources.list.d/tor.list && \
    echo "deb-src https://deb.torproject.org/torproject.org stretch main" | tee -a /etc/apt/sources.list.d/tor.list && \
    apt-get update -y && \
    apt-get install -y deb.torproject.org-keyring tor=0.3.4.8-1~d90.stretch+1 && \
    apt-get clean && \
    echo "SOCKSPort 0.0.0.0:9050 PreferSOCKSNoAuth" | tee -a /etc/tor/torrc
EXPOSE 9050
ENTRYPOINT ["/usr/sbin/tor"]
