#
FROM debian:bullseye-20221114
MAINTAINER gslin@gslin.org
COPY A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc /tmp/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc
COPY run.sh /tmp/run.sh
RUN sed -i -e 's/deb.debian.org/httpredir.debian.org/g' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y apt-transport-https ca-certificates gnupg && \
    apt-key add /tmp/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc && \
    echo "deb https://deb.torproject.org/torproject.org bullseye main" | tee /etc/apt/sources.list.d/tor.list && \
    echo "deb-src https://deb.torproject.org/torproject.org bullseye main" | tee -a /etc/apt/sources.list.d/tor.list && \
    apt-get update -y && \
    apt-get install -y deb.torproject.org-keyring tor=0.4.7.11-1~d11.bullseye+1 && \
    apt-get clean && \
    echo "SOCKSPort 0.0.0.0:9050 PreferSOCKSNoAuth" | tee -a /etc/tor/torrc
EXPOSE 9050
ENTRYPOINT ["/tmp/run.sh"]
