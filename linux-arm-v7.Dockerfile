FROM hotio/base@sha256:ab3c3033dda603b5db2bf35b0e36a1f0a39c231b6e2fc6da2abae12d8908e41f

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

# install packages
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        libicu66 && \
# clean up
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ARG VERSION

RUN curl -fsSL "https://github.com/Ombi-app/Ombi/releases/download/v${VERSION}/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
