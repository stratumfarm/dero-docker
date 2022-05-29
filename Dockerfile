FROM alpine:latest as build

ARG DERO_VERSION

WORKDIR /app

RUN apk --no-cache update &&\ 
    apk --no-cache add curl

RUN curl -LJO https://github.com/deroproject/derohe/releases/download/${DERO_VERSION}/dero_linux_amd64.tar.gz
RUN tar xvzf dero_linux_amd64.tar.gz
WORKDIR /app/dero_linux_amd64

FROM alpine:latest
COPY --from=build /app/dero_linux_amd64/derod-linux-amd64 /derod
RUN apk --no-cache update &&\ 
    apk --no-cache add screen
CMD ["screen", "-S", "dero", "/derod"]

EXPOSE 10100 10102 10103