    pipeline {
        agent any

        environment {
            // Define Docker Hub credentials ID
            DOCKERHUB_CREDENTIALS_ID = 'soarespt'
            // Define Docker Hub repository name
            DOCKERHUB_REPO = 'soarespt/fartocelkelvin'
            // Define Docker image tag
            DOCKER_IMAGE_TAG = 'latest'
        }
        stages {
            stage('Checkout') {
                steps {
                    // Checkout code from Git repository
                    git branch:'main', url:'https://github.com/SoaresPT/FarToCel/'
                }
            }
            stage('Build Docker Image') {
                steps {
                    // Build Docker image
                    script {
                        docker.build("${DOCKERHUB_REPO}:${DOCKER_IMAGE_TAG}")
                    }
                }
            }
            stage('Push Docker Image to Docker Hub') {
                steps {
                    // Push Docker image to Docker Hub
                    script {
                        docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS_ID) {
                            docker.image("${DOCKERHUB_REPO}:${DOCKER_IMAGE_TAG}").push()
                        }
                    }
                }
            }

        }
    }