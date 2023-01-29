#! /bin/sh
cd /opt/app-root
echo 'run oc.sh'
sh oc.sh &
echo 'run nr_day_job.py'
python nr_day_job.py
