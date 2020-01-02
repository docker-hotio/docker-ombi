FROM hotio/dotnetcore@sha256:7936c472229a905302881cd7df06b0ea45994a4cf1f710b940ec0f9c6e97857e

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=3.0.4958
ARG OMBI_JOBID=8wcmr9p52gh5mmoi

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
