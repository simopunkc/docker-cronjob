FROM golang:alpine AS build
COPY /go-app /app/go
WORKDIR /app/go
RUN CGO_ENABLED=0 go build -o go-hello-world main.go

FROM python:3.9

COPY --from=build /app/go/go-hello-world /app/go/go-hello-world
EXPOSE 3001

COPY /python-app /app/python
WORKDIR /app/python
RUN pip install -r requirements.txt
EXPOSE 81

WORKDIR /
RUN apt-get update
RUN apt-get -y install cron
COPY /cronjob /cronjob
COPY /startup.sh /scripts/startup.sh
COPY /cron.sh /scripts/cron.sh
RUN chmod 755 -R /cronjob
RUN chmod 755 -R /scripts
RUN chmod +x -R /cronjob
RUN chmod +x -R /scripts

RUN (crontab -l ; echo "*/1 * * * * /scripts/cron.sh >> /scripts/cronjob.log 2>&1")| crontab -u root -

ENTRYPOINT ["/scripts/startup.sh"]