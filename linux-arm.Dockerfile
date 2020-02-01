FROM hotio/dotnetcore@sha256:528d4e17721bb71d0bbc380b5ca0146e646e1350f5d1407b73999d9ffb467786

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=3.0.4892

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
