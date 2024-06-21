FROM golang:1.22-alpine3.19 as build

WORKDIR /usr/src/

COPY main.go .

RUN go mod init hello

RUN go build -o hello .

FROM scratch

WORKDIR /usr/src/

COPY --from=build /usr/src/hello .

CMD ["./hello"]