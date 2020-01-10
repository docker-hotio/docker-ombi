FROM hotio/dotnetcore@sha256:27743ee3db700016e17ec460d26133aafededfe75fc81826f9de2f07958225a6

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4987
ARG OMBI_JOBID=pfafr1e7cpc0i1jj

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
