FROM hotio/base@sha256:d57908141d7023ba4677b56c6cf021954f4c83a61c5ba1a0e13cd92ba377d7b9

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

RUN curl -fsSL "https://github.com/tidusjar/Ombi.Releases/releases/download/v${VERSION}/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
