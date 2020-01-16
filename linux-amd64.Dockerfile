FROM hotio/dotnetcore@sha256:db0510b5afcbebfa2ccc0175e1e5cd1772b351b3813c98ca948cd9b8634c15d4

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4994
ARG OMBI_JOBID=8dp3pqudcq9hjh4y

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
