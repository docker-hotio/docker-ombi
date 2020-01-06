FROM hotio/dotnetcore@sha256:505035007d109b4a3ac12140cb74bb6cb32797596c0ad4bfdc1ffd8ccc10f5e3

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4983
ARG OMBI_JOBID=oo3cg8v9yd9o0wdm

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
