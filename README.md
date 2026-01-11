# Node App CI Pipeline

This repository contains a simple Node.js application with a **complete CI pipeline** using **GitHub Actions**.  
The pipeline performs linting, testing, matrix builds, and automatically builds & pushes Docker images to Docker Hub.


## Features

- Automated CI/CD pipeline with GitHub Actions
- Docker containerization with multi-stage build
- Code linting with ESLint
- Unit testing with Jest
- Automated Docker image build and push to Docker Hub

---

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── docker-Image-CI-Pipeline.yml  # GitHub Actions workflow
├── public/
│   └── index.html                        # Static HTML page
├── src/
│   └── app.js                            # Main application file
├── tests/
│   └── app.test.js                       # Test file
├── Dockerfile                            # Docker configuration
├── package.json                          # Node.js dependencies and scripts
└── README.md                             # This file
```
---

## 🚀 CI Pipeline Overview

### The GitHub Actions workflow includes:

### **1. Matrix Build & Test**
The app is tested against multiple Node.js versions:

- Node.js 16  
- Node.js 18  
- Node.js 20  

### **Steps performed:**
✔ Install dependencies  
✔ Run ESLint  
✔ Run Jest tests  
✔ Run on multiple Node versions (matrix builds)  

If everything passes, then the next stage starts.

---

### **2. Docker Build & Push (Only if tests succeed)**

The Docker job:

✔ Builds Docker image using **Buildx**  
✔ Pushes image with `latest` tag  

## Prerequisites

- Node.js (version 18 or higher)
- npm
- Docker (for containerized deployment)
- Docker Hub account (for CI/CD pipeline)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/karan-karan/Node-App-CI-Pipeline.git
   cd Node-App-CI-Pipeline
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

## Usage

### Running Locally

Start the application:
```bash
npm start
```

The server will start on port 3000. Open your browser and navigate to `http://localhost:3000` to see the application running.

### Running with Docker

1. Build the Docker image:
   ```bash
   docker build -t node-app .
   ```

2. Run the container:
   ```bash
   docker run -p 3000:3000 node-app
   ```

3. Access the application at `http://localhost:3000`

## Testing

Run the test suite:
```bash
npm test
```

Run the linter:
```bash
npm run lint
```

## CI Pipeline

This project uses GitHub Actions for continuous integration. The pipeline:

1. Triggers on pushes to the `main` branch
2. Sets up Node.js environment
3. Installs dependencies
4. Runs linting and tests
5. Builds and pushes Docker image to Docker Hub

### Required Secrets

For the CI/CD pipeline to work, you need to set up the following secrets in your GitHub repository:

- `DOCKER_HUB_USERNAME`: Your Docker Hub username
- `DOCKER_HUB_ACCESS_TOKEN`: Your Docker Hub access token

## 📌 Difference between `RUN npm install` and `RUN npm ci --omit=dev`

### 🔹 `RUN npm install`
- Installs dependencies listed in **package.json**.
- May update or modify **package-lock.json**.
- Installs both `dependencies` and `devDependencies` (unless omitted manually).
- Ideal for **local development**, but **not always deterministic** because versions may vary.

### 🔹 `RUN npm ci --omit=dev`
- `npm ci` = **Clean Install**, designed for **CI/CD pipelines**.
- Requires and strictly follows **package-lock.json** (no version changes).
- Removes `node_modules` before installing → clean & reproducible builds.
- `--omit=dev` ensures **only production dependencies** are installed.
- Results in **faster, reliable, and consistent** deployments.

### ✅ Summary
| Command | Use Case | Installs Dev Deps | Lockfile Changed? | Deterministic? |
|--------|----------|-------------------|--------------------|----------------|
| `npm install` | Local dev | Yes | Yes | No |
| `npm ci --omit=dev` | CI/CD, Production | No | No | Yes |


## Issue Faced: Cannot find module '/app/app.js'

**Cause**:
The Node.js application entry file was located inside the src/ directory (src/app.js), but the Docker container was trying to run /app/app.js, causing the module not found error.

**Resolution**:
Update the Dockerfile to point to the correct entry path:
```bash
CMD ["node", "src/app.js"]
```

## Author

Karan 
