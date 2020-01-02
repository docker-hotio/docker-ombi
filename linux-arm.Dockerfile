FROM hotio/dotnetcore@sha256:f588c6eeab57cc781ad3bade69b384293c85b8999a88fdf8cd6f9923781a8555

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4960
ARG OMBI_JOBID=udpav5wo0o31cotw

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
