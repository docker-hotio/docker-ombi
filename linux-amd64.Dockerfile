FROM hotio/dotnetcore@sha256:f22c5a01c4df92ff8ab56f61783774fac8c4e335379cf483875659c08a30a4a8

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4987
ARG OMBI_JOBID=pfafr1e7cpc0i1jj

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
