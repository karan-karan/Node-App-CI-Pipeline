# Stage 1 — Install dependencies
FROM node:18-slim AS deps
WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

# Stage 2 — Copy source code
FROM node:18-slim AS builder
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Stage 3 — Final runtime (minimal)
FROM node:18-slim
WORKDIR /app

COPY --from=builder /app ./

# Expose the app port
EXPOSE 3000

# Start correct entrypoint
CMD ["node", "src/app.js"]
