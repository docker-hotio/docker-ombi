FROM hotio/dotnetcore@sha256:995db9388c563c1072c399e485e5ffbede85ee4176bc3aac8bdefb8bde58c4d6

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4994
ARG OMBI_JOBID=8dp3pqudcq9hjh4y

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
