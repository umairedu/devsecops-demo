# DevSecOps CI Pipeline Demo


This project demonstrates a complete **DevSecOps CI pipeline** using **GitHub Actions**, integrating code quality checks, automated testing, security scanning, and Docker image build steps.  

---

## What This Project Demonstrates

This repository highlights the following real-world DevOps capabilities:

- Automated CI pipeline using GitHub Actions  
- Linting & code quality checks with **ESLint**  
- Unit testing with **Jest**  
- **Container image scanning** with Trivy  

---

## Project Structure

```
devsecops-demo/
│
├── app/
│   ├── index.js
│   ├── package.json
│   ├── package-lock.json
│   ├── .eslintrc.json
│   └── tests/
│       └── app.test.js
│
├── .github/
│   └── workflows/
│       └── ci.yaml
│
├── Dockerfile
├── .gitignore
└── README.md
```

---

## CI Pipeline Stages

### 1 **Checkout & Setup**
GitHub Actions checks out the repository and installs dependencies.

### 2️ **Linting**
Ensures the code follows best practices and avoids common mistakes using ESLint.

### 3️ **Unit Testing**
Runs Jest tests to validate functionality.

### 4️ **SAST Scan (Semgrep)**
Analyzes the code for security issues, unsafe patterns, and common vulnerabilities.

### 5️ **Dependency Scan (Trivy)**
Scans `node_modules` and the repository for vulnerable dependencies.

### 6️ **Docker Image Build**
Builds a production-ready Docker image using `node:18-slim`.

### 7️ **Container Image Scan (Trivy)**
Scans the built Docker image for vulnerabilities.

### 8️ **Push to Docker Hub**
Pushes the built Docker image to Docker Hub (`umairedu/devsecops-demo`).

---

## Quick Start

### Prerequisites

- Node.js 18+ installed
- Docker installed
- Docker Hub account (for pushing images)

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/umairedu/devsecops-demo.git
   cd devsecops-demo
   ```

2. **Install dependencies**
   ```bash
   cd app
   npm install
   ```

3. **Run tests**
   ```bash
   npm test
   ```

4. **Run linting**
   ```bash
   npm run lint
   ```

###  Docker Build (Local)

```bash
# Build the image
docker build -t umairedu/devsecops-demo .

# Run the container
docker run umairedu/devsecops-demo
```

###  Pull from Docker Hub

```bash
docker pull umairedu/devsecops-demo:latest
docker run umairedu/devsecops-demo:latest
```

---

## Security Tools Used

### Semgrep
Fast, powerful static analysis to detect code vulnerabilities:
- Insecure functions
- Weak regex patterns
- Hardcoded secrets
- Known CVE patterns

### Trivy
Comprehensive security scanning:
- Vulnerable npm packages
- CVEs in dependencies
- Container image vulnerabilities
- Misconfigurations

---

## Pipeline Results

Every commit or pull request triggers the pipeline automatically.  
You can see results under:

```
GitHub → Actions → CI / DevSecOps Pipeline
```