FROM hotio/dotnetcore@sha256:fc1deeae14f5b8fe0d4fe4006fe4f704005f7843e6f85f047dff1b3f1a2c82ea

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4994
ARG OMBI_JOBID=8dp3pqudcq9hjh4y

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
