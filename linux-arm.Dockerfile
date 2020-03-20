FROM hotio/dotnetcore@sha256:ee29e0573ce844055e724eff308df38ed1e9a121255bb69d989fb2c3115f141c

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=3.0.5083
ARG OMBI_JOBID=u13e8e6waqnamd5r

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
