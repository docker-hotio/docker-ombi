ARG BRANCH
FROM hotio/dotnetcore:${BRANCH}

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

COPY root/ /

# https://github.com/tidusjar/Ombi/releases
ENV OMBI_VERSION=3.0.4817

# install app
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v${OMBI_VERSION}/linux-arm64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"
