FROM hotio/dotnetcore@sha256:be8a296f56e920eac770470fa3e5b499f2f805a06a1184f4c790f54a7a06098c

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=3.0.4949
ARG OMBI_JOBID=ud06vef7oaj46329

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
