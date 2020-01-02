FROM hotio/dotnetcore@sha256:e36e3de92233c69859f85d8fa1ca5066840d2f6d2e419b5c6f934603a0cefa45

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

# https://github.com/tidusjar/Ombi/releases
ARG OMBI_VERSION=3.0.4892

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
