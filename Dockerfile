FROM hotio/dotnetcore

ARG DEBIAN_FRONTEND="noninteractive"

ENV APP="Ombi" HOME="${CONFIG_DIR}"
EXPOSE 5000
HEALTHCHECK --interval=60s CMD curl -fsSL http://localhost:5000 || exit 1

# install app
# https://github.com/tidusjar/Ombi/releases
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v3.0.4256/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /

