FROM hotio/base@sha256:065d9e475a297874726918046127c6a2bf1d4c1d72f69610724d84611846dc03

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

RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${VERSION}/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
