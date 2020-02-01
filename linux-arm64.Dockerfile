FROM hotio/dotnetcore@sha256:4645191ffe8a667b175c92738f81646ae8575ad2b6d61338825c24fbe5bbf4a5

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=3.0.4892

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
