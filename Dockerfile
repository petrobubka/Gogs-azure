FROM alpine:3.15


RUN echo -e "https://alpine.global.ssl.fastly.net/alpine/v3.18/community" > /etc/apk/repositories
RUN echo -e "https://alpine.global.ssl.fastly.net/alpine/v3.18/main" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache binutils go postgresql-client git openssh


RUN mkdir /gogs
WORKDIR /gogs
COPY . /gogs

EXPOSE 80
EXPOSE 22

RUN go build -o gogs

CMD ["/gogs/gogs", "web"]
