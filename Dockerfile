FROM docker.io/python:3.12.0-alpine3.18

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git pipx && \
    adduser -D copier
USER copier
RUN pipx install copier==9.1.1
COPY --chown=copier:copier ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod u+x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
