#!/bin/bash
if [ -z "$CRON_SCHEDULE" ]; then
  echo "No schedule found"
  python3 -m full_offline_backup_for_todoist --verbose download --with-attachments 
  echo "Python script executed once"
  exit 0
else
  echo "Schedule found: $CRON_SCHEDULE"
  echo "$CRON_SCHEDULE . /etc/environment; python3 -m full_offline_backup_for_todoist --verbose download --with-attachments >> /var/log/cron.log 2>&1" > /etc/cron.d/my-cron-job
  echo "" >> /etc/cron.d/my-cron-job # add new row
  chmod 0644 /etc/cron.d/my-cron-job
  crontab /etc/cron.d/my-cron-job
  touch /var/log/cron.log
  echo "Cron job created"

  exec cron -f
fi

