FROM hotio/base@sha256:392ac7ede33ba9b86e8656c9916e1d792e3f899d718a3c8229a0fa2ea308c6f9

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

RUN curl -fsSL "https://github.com/Ombi-app/Ombi/releases/download/v${VERSION}/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
