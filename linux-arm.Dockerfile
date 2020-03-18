FROM hotio/dotnetcore@sha256:1a08edbf141bce113202a41c459490ce9d9d95be258284cecfd79229debe5f8f

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=4.0.261

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-arm-${OMBI_VERSION##*.}.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
