FROM alpine

# maintainer js@faudin.de
# basic image for quick backups
# restore not yet documented

ARG duplicity_uid


RUN set -x \
        && apk update \
        && apk add  duplicity rsync openssh-client && \

        adduser -D \
              --home /home/duplicity \
              --gecos "backup user" \
              --uid $duplicity_uid \
              duplicity
ADD usr/local/bin /usr/local/bin
# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/*sh
USER duplicity
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
