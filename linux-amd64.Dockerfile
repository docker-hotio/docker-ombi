FROM hotio/dotnetcore@sha256:9247b0080acf3f45f55b6c73c1933f5c366cb19364ba12e2641fe9e888169ffc

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi.Releases/releases/download/v${OMBI_VERSION}/linux-x64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
