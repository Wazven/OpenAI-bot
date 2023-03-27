FROM node:16 AS client-front

WORKDIR /OpenAI-bot/client

COPY client/package*.json ./

RUN npm install

COPY client .

RUN npm run build

FROM node:16 AS server-back

WORKDIR /OpenAI-bot/server

COPY server/package*.json ./

RUN npm install

COPY server .

ENV OPENAI_API_KEY=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

EXPOSE 5000

CMD ["node", "server.js"]

FROM nginx:1.22.1

COPY --from=client-front /OpenAI-bot/client/dist /usr/share/nginx/html

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]