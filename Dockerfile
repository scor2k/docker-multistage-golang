FROM golang:1.15.6 as builder
WORKDIR /go/src/github.com/scor2k/docker-multistage-golang/
COPY server.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o server .


FROM alpine:3.12.3
RUN apk --no-cache add ca-certificates
WORKDIR /opt/app
COPY --from=builder /go/src/github.com/scor2k/docker-multistage-golang/server .
CMD ["./server"]
