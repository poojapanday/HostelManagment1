pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "poojapanday12345/hostel-app"
        DOCKER_CREDS = "dockerhub-creds"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/poojapanday/HostelManagment1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDS) {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
            }
        }

    }

}