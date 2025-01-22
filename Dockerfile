FROM node:22-alpine

WORKDIR /app

RUN apk add --no-cache bash curl

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve

EXPOSE 3000

CMD ["serve", "-s", "dist", "-l", "3000"]
