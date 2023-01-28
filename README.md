# docker-nebula-lighthouse

A nebula lighthouse in a Docker container.

The user is expected to mount a configuration directory to `/etc/nebula` with `config.yml` being the configuration file.  See [the example/ subdirectory of the repository](https://github.com/slackhq/nebula/blob/master/examples/config.yml) for an example.

Run the shell with additional privileges to configure the tun interface:

```shell
docker run \
    -it \
    --rm \
    --mount type=bind,source=$PWD/config-lighthouse,target=/etc/nebula \
    --cap-add=NET_ADMIN \
    --device /dev/net/tun:/dev/net/tun \
    --expose 4242 \
    --publish 0.0.0.0:4242:4242/udp \
    nebula-lighthouse
```
