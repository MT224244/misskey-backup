FROM postgres:15-alpine

RUN apk update
RUN apk add curl unzip p7zip

RUN curl https://rclone.org/install.sh | bash

RUN mkdir -p /var/spool/cron/crontabs

COPY rclone.conf /root/.config/rclone/

COPY backup.sh /root/
RUN chmod +x /root/backup.sh

COPY get.sh /
RUN chmod +x /get.sh

COPY crontab /var/spool/cron/crontabs/root
RUN chmod 0644 /var/spool/cron/crontabs/root

CMD sh -c "crond -l 0 -f"
