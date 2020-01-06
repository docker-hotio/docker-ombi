FROM hotio/dotnetcore@sha256:b9cbf13d12168c6bb898dc5240e1d40a6cb2699bcfc8c0a958c764ce18034115

ARG DEBIAN_FRONTEND="noninteractive"

ENV HOME="${CONFIG_DIR}"
EXPOSE 5000

ARG OMBI_VERSION=4.0.4986
ARG OMBI_JOBID=9kp7l8s9nxwd0i4b

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
