<div id="readme-top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="images/logo.svg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">deploy.</h3>

  <p align="center">
    Automate deployment process using Jenkins and AWS

  </p>
</div>

<p align="center">
  <a href="#overview">Overview</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#built-with">Built With</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#infrastructure">Infrastructure</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#roadmap">Roadmap</a>
  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#contributing">Contributing</a>

</p>

## 🔍 Overview

This project is aimed at automating the deployment process using Jenkins and AWS. It provides a seamless way to deploy applications by integrating Jenkins for continuous integration and delivery and leveraging AWS services for hosting and managing the application infrastructure.

![Deploy. Screenshot][product-screenshot]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🛠️ Built With

This project was built using the following technologies:

- [Jenkins](https://www.jenkins.io/) - CI/CD tool for automating the deployment process
- [Maven](https://maven.apache.org/) - Build automation tool used for managing the project's build lifecycle
- [SonarQube](https://www.sonarqube.org/) - Open-source platform for continuous inspection of code quality
- [Docker](https://www.docker.com/) - Open platform for developing, shipping, and running containerized applications
- [EC2](https://aws.amazon.com/ec2/) - IaaS service that provides secure, resizable compute capacity in the cloud
- [ECR](https://aws.amazon.com/ecr/) - Fully managed container registry that makes it easy to store, manage, share, and deploy Docker container images
- [ECS w/ Fargate](https://aws.amazon.com/ecs/) - Fully managed container orchestration service that makes it easy to run, stop, and manage Docker containers on a cluster

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🏗️ Infrastructure

![Jenkins Pipeline][jenkins-pipeline]

Our journey starts when the developer pushes the code to the repository. A webhook triggers the Jenkins pipeline, which is responsible for:

📥 Checking out the code from the repository
🛠️ Building the application w/ Maven
✅ Running unit tests
📑 Generating checkstyle reports w/ Maven
🔍 Running SonarQube analysis
✔️ Checking if the code meets the quality gate
🐳 Building the Docker image
🗂️ Pushing the Docker image to ECR
🚀 Deploying the application to ECS w/ Fargate

<span style="color:green">P.S: A notification is sent to the developer either on success or failure of the pipeline in Microsoft Teams.</span>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🗺️ Roadmap

- [ ] Use Terraform for infrastructure as code
- [ ] Add support for Kubernetes

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Contributing

Embracing collaboration is what fuels the heartbeat of the open-source community. Your contributions are not just welcomed but cherished.

Should you have ideas for improvement, we invite you to fork the repository and initiate a pull request. Alternatively, feel free to open an issue, labeled 'enhancement,' to share your insights.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feat/new-feature-name`)
3. Commit your Changes (`git commit -m 'feat: add some new feature'`)
4. Push to the Branch (`git push origin feat/new-feature-name`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->

[product-screenshot]: images/demo.gif
[jenkins-pipeline]: images/pipeline.png
