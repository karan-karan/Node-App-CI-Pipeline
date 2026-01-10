# ---- Stage 1: Build + Install Dependencies ----
FROM node:18-slim AS build
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy source code
COPY . .

# ---- Stage 2: Final Runtime Image ----
FROM node:18-slim
WORKDIR /app

# Copy only what is needed from build stage
COPY --from=build /app /app

# Expose application port
EXPOSE 3000

# Start application
CMD ["node", "src/app.js"]
