FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
        vnstat \
      && rm -rf /var/lib/apt/lists/*


VOLUME /var/lib/vnstat

ENTRYPOINT ["/usr/sbin/vnstatd"]

CMD ["-n"]
