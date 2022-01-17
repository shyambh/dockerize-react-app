FROM node:16-alpine3.12 AS Production

WORKDIR /app
ENV NODE_ENV=production
COPY package*.json /app
RUN npm install

COPY . /app

EXPOSE 8080

CMD ["npm", "run", "start"]