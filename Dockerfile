ARG target=amd64
FROM $target/alpine

# set version label
LABEL maintainer="carlosedp"

ARG arch=amd64
ENV ARCH=$arch

COPY tmp/qemu-$ARCH-static /usr/bin/qemu-$ARCH-static

RUN apk update && \
    apk upgrade && \
    apk add vnstat && \
    rm -rf /var/cache/apk/*

## Clean apk cache files
RUN rm -rf /var/cache/apk/*

VOLUME /var/lib/vnstat

CMD ["/usr/sbin/vnstatd", "-n"]
