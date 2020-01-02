FROM hotio/dotnetcore@sha256:1ed764ed85a051ecd38c53da4772844f48ae06be168bc2a3f2702aae99e65911

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=3.0.4958
ARG OMBI_JOBID=8wcmr9p52gh5mmoi

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
