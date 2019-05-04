Running [Tor](https://www.torproject.org/) (socks5) in [Docker](https://www.docker.com/) container.

Command
=======

Use this command to run once only:

    docker run -p 127.0.0.1:9050:9050 -d gslin/tor

Use this command to register (run at booting):

    docker run -dit -p 9050:9050 --restart always gslin/tor:latest
