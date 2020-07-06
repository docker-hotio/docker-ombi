FROM hotio/dotnetcore@sha256:29b38e2c58e1f34968764da042f48ab52840a25eb30466d6e81a16010e9ac19a

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION
ARG OMBI_JOBID

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
