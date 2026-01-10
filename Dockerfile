# ------------ Stage 1: Build app ------------
FROM node:18-slim AS builder
WORKDIR /app

# Install ONLY production dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Copy app source
COPY . .

# ------------ Stage 2: Distroless runtime ------------
FROM gcr.io/distroless/nodejs18
WORKDIR /app

# Copy everything from builder
COPY --from=builder /app ./

# Optional metadata
EXPOSE 3000

# Distroless expects the entry script only
CMD ["app.js"]
