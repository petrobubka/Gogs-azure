# Build stage
FROM alpine:3.15 AS builder


RUN echo -e "https://alpine.global.ssl.fastly.net/alpine/v3.18/community" > /etc/apk/repositories
RUN echo -e "https://alpine.global.ssl.fastly.net/alpine/v3.18/main" >> /etc/apk/repositories


RUN apk update && apk add --no-cache go git

WORKDIR /app
COPY . .

RUN go build -o gogs

# Final stage
FROM alpine:3.15

RUN echo -e "https://alpine.global.ssl.fastly.net/alpine/v3.18/community" > /etc/apk/repositories
RUN echo -e "https://alpine.global.ssl.fastly.net/alpine/v3.18/main" >> /etc/apk/repositories
RUN apk update
RUN apk add postgresql-client go git openssh 

WORKDIR /gogs

COPY --from=builder /app/gogs /gogs

EXPOSE 80
EXPOSE 22

CMD ["/gogs/gogs", "web"]
