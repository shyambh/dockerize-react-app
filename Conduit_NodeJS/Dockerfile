FROM node:16-alpine3.12 AS Production

WORKDIR /app
ENV NODE_ENV=production
ENV DB_PASSWORD=$POSTGRES_PASSWORD
COPY package*.json /app/
RUN yarn install

COPY . /app

EXPOSE 8080

CMD ["yarn", "run", "start"]