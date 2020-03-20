FROM hotio/dotnetcore@sha256:00b16987778c71dcfc7d16ddd5239ae73aa476caeb7f3cb4566f436fd52edd95

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=3.0.5083
ARG OMBI_JOBID=u13e8e6waqnamd5r

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
