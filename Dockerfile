FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add vnstat && \
    rm -rf /var/cache/apk/*
    
## Clean apk cache files
RUN rm -rf /var/cache/apk/*

VOLUME /var/lib/vnstat

ENTRYPOINT ["/usr/sbin/vnstatd"]

CMD ["-n"]
