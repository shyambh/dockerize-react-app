FROM node:16-alpine3.12 AS Production

WORKDIR /app
ENV NODE_ENV=production
COPY package*.json /app/
RUN yarn install \
    && yarn add --dev typescript @types/react @types/node

COPY . /app

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]