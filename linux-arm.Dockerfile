FROM hotio/dotnetcore@sha256:ee29e0573ce844055e724eff308df38ed1e9a121255bb69d989fb2c3115f141c

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=4.0.286

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
