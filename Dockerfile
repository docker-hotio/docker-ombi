FROM hotio/base

ARG DEBIAN_FRONTEND="noninteractive"

ENV APP="Ombi" HOME="${CONFIG_DIR}"
EXPOSE 5000
HEALTHCHECK --interval=60s CMD curl -fsSL http://localhost:5000 || exit 1

# install packages
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        libssl1.0.0 libicu60 && \
# clean up
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# install app
# https://github.com/tidusjar/Ombi/releases
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v3.0.4256/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
