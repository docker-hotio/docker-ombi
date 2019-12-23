FROM hotio/dotnetcore@sha256:9b72ffe7cad1d0433c4e5781849b7ed927166700afa6f677d5fa57eba2199486

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=3.0.4949
ARG OMBI_JOBID=ud06vef7oaj46329

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
