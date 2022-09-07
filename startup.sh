#!/bin/sh
service cron start

### replace with command to run app ###
python3 app.py
while true; do sleep 1000; done
### replace with command to run app ###