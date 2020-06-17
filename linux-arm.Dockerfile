FROM hotio/dotnetcore@sha256:c2be402e8124e97a57aafe960966c7d1020465f7a49580002e501219e200a2b3

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 5000

ARG OMBI_VERSION
ARG OMBI_JOBID

# install app
RUN curl -fsSL "https://ci.appveyor.com/api/buildjobs/${OMBI_JOBID}/artifacts/linux-arm.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
