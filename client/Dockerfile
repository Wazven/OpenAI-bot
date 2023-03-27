FROM node:16

WORKDIR /OpenAI-bot/client

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.22.1

COPY /OpenAI-bot/client/dist /usr/share/nginx/html

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]