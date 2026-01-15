FROM node:18-alpine

# Install modern OpenSSL (3.x) and compatibility headers
RUN apk add --no-cache openssl libc6-compat

WORKDIR /usr/src/app

COPY . .

# Install dependencies
RUN yarn install

# Explicitly generate the client inside the container environment
RUN npx prisma generate

RUN yarn build

CMD ["yarn", "start"]