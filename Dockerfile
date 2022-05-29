FROM alpine:latest as build

ARG DERO_VERSION

WORKDIR /app

RUN apk --no-cache update &&\ 
    apk --no-cache add curl

RUN curl -LJO https://github.com/deroproject/derohe/releases/download/${DERO_VERSION}/dero_linux_amd64.tar.gz
RUN tar xvzf dero_linux_amd64.tar.gz
WORKDIR /app/dero_linux_amd64

FROM gcr.io/distroless/base-debian11
COPY --from=build /app/dero_linux_amd64/dero-wallet-cli-linux-amd64 /dero-wallet
CMD ["/dero"]

EXPOSE 10100 10102 10103