FROM node:12-alpine

RUN yarn global add @quasar/cli

RUN mkdir /app
WORKDIR /app/frontend

CMD [ "sh" ]