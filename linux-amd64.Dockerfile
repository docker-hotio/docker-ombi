FROM hotio/dotnetcore@sha256:cf67da1687fc378c496e2d896a932691e2838b27ce6a9764ed57d862ad79c3e4

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.5015
ARG OMBI_JOBID=wa6ybc9mwailtw7l

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
