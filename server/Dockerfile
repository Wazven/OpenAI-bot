FROM node:16

WORKDIR /OpenAI-bot/server

COPY package*.json ./

RUN npm install

COPY . .

ENV OPENAI_API_KEY=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

EXPOSE 5000

CMD ["node", "server.js"]