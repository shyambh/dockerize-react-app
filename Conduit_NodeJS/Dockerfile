FROM node:16-alpine3.12 AS Production

WORKDIR /app
ENV NODE_ENV=production
ENV DB_HOST=${DB_HOST}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV PORT=${PORT}
ENV DATABASE=${DATABASE}
COPY package*.json /app/
RUN yarn install

COPY . /app

EXPOSE 8080

CMD ["yarn", "run", "start"]