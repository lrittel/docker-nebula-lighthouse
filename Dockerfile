FROM alpine:3.17

ARG version=1.6.1

# convert the architicture first and then download the application
RUN case "$(uname -m)" in \
    aarch64) \
        arch="arm64" \
        ;; \
    x86_64) \
        arch="amd64" \
        ;; \
    *) \
        arch="$(uname -m)" \
        ;; \
    esac && \
    wget -O - "https://github.com/slackhq/nebula/releases/download/v${version}/nebula-linux-${arch}.tar.gz" | \
        tar -xzC /usr/local/bin && \
    mkdir -p /etc/nebula

CMD [ "/usr/local/bin/nebula","-config","/etc/nebula/config.yml" ]
