FROM alpine:3.9

ARG         DIR=/app

WORKDIR     $DIR

RUN         apk add -U jq \
                bash \
                python3 \
                python3-dev

ADD         src/requirements.txt .

RUN         pip3 install -r requirements.txt

ADD         src/script.sh .

CMD         [ "/app/script.sh" ]