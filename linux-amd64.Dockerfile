FROM hotio/dotnetcore@sha256:283545879a3495512c6262e26ab5cd01b27be664d9eb1d507d61ebdd62619c76

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=3.0.4949
ARG OMBI_JOBID=ud06vef7oaj46329

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
