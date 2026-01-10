# Stage 1 — Install dependencies
FROM node:18-alpine AS deps

WORKDIR /app
COPY package*.json ./

# Install only production deps (much smaller)
RUN npm ci --omit=dev

# Stage 2 — Copy source code
FROM node:18-alpine AS builder

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Stage 3 — Final runtime image
FROM node:18-alpine

WORKDIR /app

# Copy only what is needed
COPY --from=builder /app ./

EXPOSE 3000
CMD ["npm", "start"]
