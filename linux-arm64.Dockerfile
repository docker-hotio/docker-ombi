FROM hotio/dotnetcore@sha256:6f081711d6b79cd97d5f1feccaf3fb48d4bc3dc06a9e3958a378ebc7820cd2ab

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION=3.0.5020
ARG OMBI_JOBID=k7lnfqkyw4x1bpwo

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
