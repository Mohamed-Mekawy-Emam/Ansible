#!/bin/sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom|/dev/loop*' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 90 ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
     mail -s "Alert: Almost out of disk space $usep%" memam@memam.local
  fi
done

# cp checkDiskSpace /etc/cron.daily/
# chmod +x /etc/cron.daily/checkDiskSpace
#OR install as cronjob:
#crontab -e
#10 0 * * * /path/to/checkDiskSpace
