ARG BRANCH
FROM hotio/dotnetcore:${BRANCH}

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000
HEALTHCHECK --interval=60s CMD curl -fsSL http://localhost:5000 || exit 1

COPY root/ /

# install app
RUN version=$(sed -n '1p' /versions/ombi) && \
    curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${version}/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"
