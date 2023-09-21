FROM node:20-alpine

WORKDIR /app

ADD . /app

RUN npm ci

CMD ["npm", "run", "start"]
