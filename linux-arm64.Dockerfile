FROM hotio/dotnetcore@sha256:6f081711d6b79cd97d5f1feccaf3fb48d4bc3dc06a9e3958a378ebc7820cd2ab

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=4.0.271

# install app
RUN zipfile="/tmp/ombi.zip" && curl -fsSL -o "${zipfile}" "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-arm64.zip" && unzip -q "${zipfile}" -d "${APP_DIR}" && rm "${zipfile}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
