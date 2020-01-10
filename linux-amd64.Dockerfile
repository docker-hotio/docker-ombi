FROM hotio/dotnetcore@sha256:bb09b68cd0ed2e324d584eeda33c0402681c3371d60905dfae007fed6a301d93

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

# https://github.com/tidusjar/Ombi/releases
ARG OMBI_VERSION=3.0.4892

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
