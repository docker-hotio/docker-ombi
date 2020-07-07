FROM hotio/dotnetcore@sha256:1879e7c2b4add3c26466a8194100db78a80ab8be4f795aeaea4533313c8d8678

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
