FROM golang:1.22-alpine3.19 as build

WORKDIR /usr/src/

COPY main.go .

RUN go mod init hello

RUN go build -o hello .

FROM alpine:3.16.8

WORKDIR /usr/src/

COPY --from=build /usr/src/hello .

CMD ["./hello"]