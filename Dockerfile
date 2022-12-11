ARG IMAGE_ALPINE
FROM $IMAGE_ALPINE

# ARG SCHEDULE
# ENV SCHEDULE $SCHEDULE

RUN apk add --no-cache dcron tzdata curl && \
  cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
  echo "Europe/Moscow" > /etc/timezone && \
  apk del tzdata

COPY entrypoint /usr/local/bin/

CMD ["entrypoint"]

# doesn't work: setpgid: Operation not permitted
#CMD echo "$SCHEDULE" | crontab - && crond -f -L /dev/stdout -d
