FROM hotio/dotnetcore@sha256:e95f0cbdb0d472564fd4d08d32c89165723ededa92d034116bc81252a266e43b

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=3.0.4958
ARG OMBI_JOBID=8wcmr9p52gh5mmoi

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
