FROM hotio/dotnetcore@sha256:95f0ed9f7d1c7b64f799365b8a11c0a01c34966bb6c9307174a2969e4c228ccc

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=4.0.286

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
