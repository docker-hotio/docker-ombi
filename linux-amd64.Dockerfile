FROM hotio/base@sha256:083466dab425718df9f64f11661b62664c0cc0fe39a32d94d4b57ed294a0b243

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
