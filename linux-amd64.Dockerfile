FROM hotio/dotnetcore@sha256:1db801a70a0fe0c62efedfe3be8705a582bdda439d60ae223918dfbce9d25a6c

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-x64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
