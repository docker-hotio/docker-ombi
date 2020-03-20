FROM hotio/dotnetcore@sha256:0f3e7b1dbd27a9f258d446abcc11060e38710bf05931a070a86d4faec45c22aa

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=4.0.279

# install app
RUN zipfile="/tmp/ombi.zip" && curl -fsSL -o "${zipfile}" "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-x64.tar.gz" && unzip -q "${zipfile}" -d "${APP_DIR}" && rm "${zipfile}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
