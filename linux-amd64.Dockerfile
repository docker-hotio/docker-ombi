FROM hotio/dotnetcore@sha256:bb09b68cd0ed2e324d584eeda33c0402681c3371d60905dfae007fed6a301d93

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4993
ARG OMBI_JOBID=etnildrcot72so8p

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
