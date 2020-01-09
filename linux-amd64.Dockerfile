FROM hotio/dotnetcore@sha256:9798a12edf2bc553f19d9f84a926405bb9c8f1f6b40cc360a8d7b4b84d0dc549

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4987
ARG OMBI_JOBID=pfafr1e7cpc0i1jj

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
