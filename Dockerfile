FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

FROM gcr.io/distroless/nodejs18
WORKDIR /app
COPY --from=builder /app ./
CMD ["app.js"]
