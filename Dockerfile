############################
# STEP 1 build executable binary
############################
FROM golang AS builder 

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
ENV GO111MODULE=auto
ENV GOPATH=/go

WORKDIR $GOPATH/src/github.com/Jimbo4794/tekton-testing-repo/
COPY . /go/src/github.com/Jimbo4794/tekton-testing-repo/

RUN go build -o /go/bin/test /go/src/github.com/Jimbo4794/tekton-testing-repo/cmd/main/main.go

############################
# STEP 2 build a small image
############################
FROM alpine:3.14

COPY --from=builder /go/bin/test /go/bin/test

ENTRYPOINT ["/go/bin/test"]