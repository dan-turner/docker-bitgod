FROM node:8-alpine

RUN apk add --update --no-cache --virtual .build-deps \
        python make g++ git bash openssl sudo \
    && sudo -u node yarn global add bitgod \
    && apk del .build-deps \
    && yarn cache clean

USER node

ENV PATH="/home/node/.yarn/bin:${PATH}"

ENTRYPOINT [ "bitgod" ]
