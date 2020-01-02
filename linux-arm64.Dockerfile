FROM hotio/dotnetcore@sha256:2c5ce38a9421701c0f619549bb0cc41fe04a730e7c4d6fca89898af0b994d56d

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4960
ARG OMBI_JOBID=udpav5wo0o31cotw

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
