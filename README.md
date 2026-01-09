# My Node.js Application

This is a simple Node.js application that serves a web page indicating that the application is running. The project includes ESLint for code quality enforcement and Jest for testing functionality.

## Project Structure

```
my-node-app
├── public
│   └── index.html       # HTML file served by the application
├── src
│   └── app.js           # Main application file
├── tests
│   └── app.test.js      # Test cases for the application
├── .eslintrc.js         # ESLint configuration file
├── package.json         # npm configuration file
├── package-lock.json    # Lockfile for exact dependency versions
└── README.md            # Project documentation
```

## Key Files Explanation

### package.json
Contains project metadata, dependencies, scripts, and configuration for npm.

### package-lock.json
This file locks the exact versions of all dependencies and their sub-dependencies that were installed. It ensures that:
- Everyone working on the project gets the same dependency versions
- Builds are reproducible across different environments
- npm installs the exact same dependency tree every time
- It prevents unexpected updates that could break the application

## Getting Started

### Prerequisites

- Node.js (version 14 or higher)
- npm (Node package manager)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/karan-karan/Basic-Node-App.git
   cd Basic-Node-App
   ```

2. Install the dependencies:
   ```
   npm install
   ```

### Running the Application

To start the application, run the following command:
```
npm start
```

You can then access the application in your web browser at `http://localhost:3000`.

### Running Tests

To run the test cases, use the following command:
```
npm test
```

### Linting

To check the code for linting issues, run:
```
npm run lint
```

The ESLint configuration includes:
- Recommended rules from ESLint
- Custom rules for indentation (4 spaces), single quotes, and semicolons
- Jest environment enabled for test files to recognize testing globals


<img width="940" height="392" alt="image" src="https://github.com/user-attachments/assets/c7a5adb3-f6d5-4107-b240-db1d4ff86d43" />
