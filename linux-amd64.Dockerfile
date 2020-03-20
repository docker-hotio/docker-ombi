FROM hotio/dotnetcore@sha256:9ea9af5d24d46a0bc0ac0d266ed208e8c8164f43c79b629f406f83c8ee9f8297

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=3.0.5083
ARG OMBI_JOBID=u13e8e6waqnamd5r

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
