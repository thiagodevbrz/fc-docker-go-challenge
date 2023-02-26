############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder

WORKDIR $GOPATH/src/thiagodevbrz/golang-challenge/

COPY . .

RUN go mod init thiagodevbrz/golang-challenge

RUN go mod tidy

RUN go build main.go

FROM scratch

COPY --from=builder /go/src/thiagodevbrz/golang-challenge/main /go/bin/main
ENTRYPOINT ["/go/bin/main"]