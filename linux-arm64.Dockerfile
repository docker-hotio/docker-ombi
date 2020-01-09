FROM hotio/dotnetcore@sha256:3ddd0a6ab49711be0904ee5f2d8c02025b2b30c6dc01eaabda36c78c0fd4517f

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4987
ARG OMBI_JOBID=pfafr1e7cpc0i1jj

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
