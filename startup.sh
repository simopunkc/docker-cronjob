#!/bin/sh
service cron start

### replace with command to run app ###
cd /app/go && ./go-hello-world &
cd /app/python && python3 app.py
### replace with command to run app ###