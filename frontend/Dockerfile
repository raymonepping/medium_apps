# ----------------------------
# 🧱 Build stage
FROM node:20.19.2 AS builder

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# ----------------------------
# 🚀 Runtime stage
FROM node:20.19.2

WORKDIR /app
ENV NITRO_PORT=3000

COPY --from=builder /app/.output .output
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json .

EXPOSE 3000
CMD ["node", ".output/server/index.mjs"]