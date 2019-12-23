FROM hotio/dotnetcore@sha256:9b72ffe7cad1d0433c4e5781849b7ed927166700afa6f677d5fa57eba2199486

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

# https://github.com/tidusjar/Ombi/releases
ARG OMBI_VERSION=3.0.4892

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
