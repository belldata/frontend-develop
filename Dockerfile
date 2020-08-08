FROM node:12-alpine

ENV DOCKER_CLIENT_VERSION=19.03.8
ENV DOCKER_API_VERSION=1.40
ADD https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_CLIENT_VERSION}.tgz .

RUN yarn global add @quasar/cli

RUN mkdir /app \
    && apk --no-cache add tzdata gcc libc-dev git \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" >  /etc/timezone \
    && apk del tzdata \
    && tar xzvf docker-${DOCKER_CLIENT_VERSION}.tgz \
    && mv docker/* /usr/bin/ \
    && rm -rf /tmp/* /var/cache/apk/* docker-${DOCKER_CLIENT_VERSION}.tgz

WORKDIR /app

CMD [ "sh" ]