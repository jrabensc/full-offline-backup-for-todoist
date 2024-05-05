FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get -y install cron && rm -rf /var/lib/apt/lists/*

COPY full_offline_backup_for_todoist ./

COPY docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENV CRON_SCHEDULE=""

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cron", "-f"]
