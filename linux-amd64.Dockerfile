FROM hotio/dotnetcore@sha256:4b499eea43f1ce832dda019a15ae9dae0b4f70908ebfcb145dce8b8ef1d8039d

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION
ARG OMBI_JOBID

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
