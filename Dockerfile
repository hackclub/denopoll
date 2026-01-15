FROM node:18-alpine

RUN apk add --no-cache openssl1.1-compat

WORKDIR /usr/src/app

COPY . .

RUN yarn install && yarn build

CMD ["yarn", "start"]
