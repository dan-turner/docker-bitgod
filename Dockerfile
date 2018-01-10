FROM node:8-alpine

WORKDIR /home/node

RUN apk add --update --no-cache --virtual .build-deps \
        python make g++ git bash openssl sudo \
    && git clone https://github.com/dan-turner/bitgod.git . \
    && yarn install --force \
    && apk del .build-deps \
    && yarn cache clean

USER node

ENV PATH="/home/node/bin:${PATH}"

ENTRYPOINT [ "/home/node/bin/bitgod" ]
