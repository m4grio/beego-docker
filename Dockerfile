FROM golang:1.10-alpine

RUN \
    apk --no-cache add \
        git

RUN \
    go get -u github.com/astaxie/beego ;\
    go get -u github.com/beego/bee

CMD ["bee"]
