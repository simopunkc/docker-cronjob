FROM python:3.9

WORKDIR /cron

RUN apt-get update
RUN apt-get -y install cron

ADD app.py .
ADD startup.sh .
ADD cron.sh .
RUN chmod 755 -R /cron
RUN chmod +x startup.sh
RUN chmod +x cron.sh

RUN (crontab -l ; echo "*/1 * * * * /cron/cron.sh >> /cron/cronjob.log 2>&1")| crontab -u root -

ENTRYPOINT ["/cron/startup.sh"]