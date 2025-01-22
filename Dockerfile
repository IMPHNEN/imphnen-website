FROM node:22-alpine

WORKDIR /app

RUN apk add --no-cache bash curl

COPY package*.json ./

RUN npm install

# Copy the rest of the application code
COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "preview"]
