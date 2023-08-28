FROM node:19.8.1

WORKDIR /app

COPY package.json /app

RUN npm i --only=production && npm cache clean --force

COPY . /app

CMD node server.js


EXPOSE 3500