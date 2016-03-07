# docker-vnstatd

In order to monitor the docker hosts interfaces you need to run the container
with `--net=host`. You may or may not also need `--privileged=true` as well.

    $ docker run -d --name vnstatd \
      --net=host \
      felixweis/vnstatd

After some time we can query vnstat's database:

    $ docker exec vnstatd vnstat
    $ docker exec vnstatd vnstat -l -i eth0
    $ docker exec vnstatd vnstat -h -i docker0

You may want to persist `/var/lib/vnstat`.

Tested and works with CoreOS.
