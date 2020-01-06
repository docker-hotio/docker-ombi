FROM hotio/dotnetcore@sha256:7cf4c57d29c4c12f4aa2587b3a3235f07bfc0f057e321b952023883f711a7f0b

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4987
ARG OMBI_JOBID=pfafr1e7cpc0i1jj

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
