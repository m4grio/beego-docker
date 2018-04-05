FROM golang:1.10-alpine
LABEL maintainer="ahoy@m4grio.me"

RUN \
    apk --no-cache add \
        git

RUN \
    go get -v -u github.com/astaxie/beego ;\
    go get -v -u github.com/beego/bee

CMD ["bee"]
