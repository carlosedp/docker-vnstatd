FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add vnstat
    
## Clean apk cache files
RUN rm -rf /var/cache/apk/*

VOLUME /var/lib/vnstat

ENTRYPOINT ["/usr/sbin/vnstatd"]

CMD ["-n"]
