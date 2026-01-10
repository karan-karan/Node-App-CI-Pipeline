# Stage 1 — Build the app
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# copy package files and install dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# copy source code
COPY . .

# Stage 2 — Run the app (clean image)
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy only node_modules and source code
COPY --from=builder /app ./

# Expose port and start the application
EXPOSE 3000
CMD ["npm", "start"]
