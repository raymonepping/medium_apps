FROM node:20-alpine

WORKDIR /app
COPY index.js .
COPY colors.json .
RUN npm init -y && npm install express

EXPOSE 4000
CMD ["node", "index.js"]