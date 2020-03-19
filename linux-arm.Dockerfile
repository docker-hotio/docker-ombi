FROM hotio/dotnetcore@sha256:1a08edbf141bce113202a41c459490ce9d9d95be258284cecfd79229debe5f8f

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=3.0.5083
ARG OMBI_JOBID=u13e8e6waqnamd5r

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
