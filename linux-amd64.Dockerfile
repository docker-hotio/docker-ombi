FROM hotio/dotnetcore@sha256:66ed483c8422f4a5574a946517cf6998dac4ef5725b6a8b3bcbb1eadd45634bc

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=3.0.4958
ARG OMBI_JOBID=8wcmr9p52gh5mmoi

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
