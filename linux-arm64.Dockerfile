FROM hotio/dotnetcore@sha256:95f0ed9f7d1c7b64f799365b8a11c0a01c34966bb6c9307174a2969e4c228ccc

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=4.0.277

# install app
RUN zipfile="/tmp/ombi.zip" && curl -fsSL -o "${zipfile}" "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-arm64.zip" && unzip -q "${zipfile}" -d "${APP_DIR}" && rm "${zipfile}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
