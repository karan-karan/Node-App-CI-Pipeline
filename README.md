# Node App CI Pipeline

A simple Node.js application that serves a web page indicating the server is running, with a complete CI/CD pipeline using GitHub Actions and Docker.

## Features

- Simple Express.js web server serving a static HTML page
- Automated CI/CD pipeline with GitHub Actions
- Docker containerization with multi-stage build
- Code linting with ESLint
- Unit testing with Jest
- Automated Docker image build and push to Docker Hub

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

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment. The pipeline:

1. Triggers on pushes to the `main` branch
2. Sets up Node.js environment
3. Installs dependencies
4. Runs linting and tests
5. Builds and pushes Docker image to Docker Hub

### Required Secrets

For the CI/CD pipeline to work, you need to set up the following secrets in your GitHub repository:

- `DOCKER_HUB_USERNAME`: Your Docker Hub username
- `DOCKER_HUB_ACCESS_TOKEN`: Your Docker Hub access token

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

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Karan Karan
