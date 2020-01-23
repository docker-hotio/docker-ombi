FROM hotio/dotnetcore@sha256:528d4e17721bb71d0bbc380b5ca0146e646e1350f5d1407b73999d9ffb467786

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.5008
ARG OMBI_JOBID=b5t4dy3g4dmpi6oa

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
