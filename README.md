
# Voting App

This repository contains a Python-based voting application along with CI/CD pipelines implemented using GitHub Actions and Azure DevOps. The application allows users to vote and view results in real-time, making it an excellent example for demonstrating modern DevOps practices.

## Features

- **Voting functionality**: Users can vote for their preferred options.
- **Real-time results**: View voting results as they are updated.
- **CI/CD pipelines**: Automated build, test, and deployment pipelines using GitHub Actions and Azure DevOps.

## Prerequisites

- Python 3.8+
- Docker
- Azure subscription
- GitHub repository with necessary secrets configured

## Getting Started

### Setup

1. **Clone the repository**:
    ```sh
    git clone https://github.com/your-username/voting-app.git
    cd voting-app
    ```

2. **Create and activate a virtual environment**:
    ```sh
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scriptsctivate`
    ```

3. **Install dependencies**:
    ```sh
    pip install -r requirements.txt
    ```

### Running the App Locally

1. **Build and run with Docker**:
    ```sh
    docker build -t voting-app .
    docker run -d -p 5000:5000 voting-app
    ```

2. **Access the application**:
    Open your browser and navigate to `http://localhost:5000`.

## CI/CD Pipelines

### GitHub Actions

GitHub Actions is used for CI/CD to automate the testing and deployment process. The workflows are defined in the `.github/workflows/` directory.

#### Key Workflows

- **CI.yaml**: Runs tests on every push to ensure code quality.
- **CD.yaml**: Deploys the application to Azure on every push to the `main` branch.

### Azure DevOps

Azure DevOps pipelines are defined to handle the deployment and management of the application on Azure Kubernetes Service (AKS).

#### Key Pipelines

- **CI Pipeline**: 
  - **Trigger**: On push to `main` branch.
  - **Stages**:
    - Build and Test Stage
    - Build and Publish Artifact Stage
- **CD Pipeline**:
  - **Trigger**: On push to `main` branch.
  - **Jobs**:
    - BuildAutoSequencer: Downloads artifact, archives files, uploads to blob storage, and sends a message to Azure Storage Queue.

## Environment Variables

Ensure the following environment variables are set in your CI/CD environment:

- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_TENANT_ID`
- `AZURE_STORAGE_ACCOUNT`
- `AZURE_STORAGE_CONTAINER`
- `AZURE_STORAGE_KEY`
- `GITHUB_TOKEN`
- `SONAR_TOKEN`

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes.

## License

This project is licensed under the MIT License.

---

Feel free to customize this README further based on your specific project details and requirements.
