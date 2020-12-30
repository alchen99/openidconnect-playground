FROM node:alpine

LABEL maintaner="Alice Chen <alchen@apache.org>"

# Metadata
LABEL org.label-schema.vcs-url="https://github.com/alchen99/openidconnect-playground" \
      org.label-schema.docker.dockerfile="/Dockerfile"

RUN apk update \
    && apk upgrade \
    && apk add -v --update coreutils curl git jq tar \
    && rm -rf /var/cache/apk/*

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN npm install

EXPOSE 5000
CMD [ "node", "index.js" ]
