FROM hotio/dotnetcore@sha256:ee29e0573ce844055e724eff308df38ed1e9a121255bb69d989fb2c3115f141c

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=4.0.279

# install app
RUN zipfile="/tmp/ombi.zip" && curl -fsSL -o "${zipfile}" "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-arm.tar.gz" && unzip -q "${zipfile}" -d "${APP_DIR}" && rm "${zipfile}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
