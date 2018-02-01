# docker-vnstatd

[![Build Status](https://travis-ci.org/carlosedp/docker-vnstatd.svg?branch=master)](https://travis-ci.org/carlosedp/docker-vnstatd) [![](https://images.microbadger.com/badges/image/carlosedp/vnstatd.svg)](https://microbadger.com/images/carlosedp/vnstatd "Get your own image badge on microbadger.com")

In order to monitor the docker hosts interfaces you need to run the container
with `--net=host`. You may or may not also need `--privileged=true` as well.

    docker volume create vnstat_data
    docker run -d \
      --name vnstatd \
      --restart=unless-stopped \
      --privileged=true \
      -v vnstat_data:/var/lib/vnstat \
      carlosedp/vnstatd

After some time we can query vnstat's database:

    $ docker exec vnstatd vnstat
    $ docker exec vnstatd vnstat -l -i eth0
    $ docker exec vnstatd vnstat -h -i docker0

Data is persisted in vnstat_data Docker Volume mounted from `/var/lib/vnstat`.

Tested and works with CoreOS.
