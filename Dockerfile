FROM hotio/dotnetcore

ARG DEBIAN_FRONTEND="noninteractive"
ARG ARCH_OMBI="linux"

ENV APP="Ombi" HOME="${CONFIG_DIR}"
ENV ARCH="${ARCH_OMBI}"
EXPOSE 5000
HEALTHCHECK --interval=60s CMD curl -fsSL http://localhost:5000 || exit 1

# install app
# https://github.com/tidusjar/Ombi/releases
RUN curl -fsSL "https://github.com/tidusjar/Ombi/releases/download/v3.0.4680/${ARCH_OMBI}.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
