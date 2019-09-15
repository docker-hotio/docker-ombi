ARG BRANCH
FROM hotio/dotnetcore:${BRANCH}

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000
HEALTHCHECK --interval=60s CMD curl -fsSL http://localhost:5000 || exit 1

COPY root/ /

# https://github.com/tidusjar/Ombi/releases
ENV OMBI_VERSION=3.0.4680

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"
