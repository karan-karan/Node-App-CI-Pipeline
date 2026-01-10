# ---------- BUILD STAGE ----------
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

# ---------- RUNTIME STAGE ----------
FROM node:20-alpine

WORKDIR /app

# Copy only necessary production files
COPY --from=builder /app /app

# Expose application port if needed
EXPOSE 3000

CMD ["node", "app.js"]
