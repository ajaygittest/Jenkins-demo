pipeline {
    agent any
    environment {
    DOCKER_IMAGE = "cicd-demo"
    K8S_DEPLOYMENT = "k8s-deployment.yaml"
}

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Spring Boot App') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t cicd-demo .'
            }
        }

        stage('Run Docker Container') {
    steps {
        bat 'docker stop cicd-demo || exit 0'
        bat 'docker rm cicd-demo || exit 0'
        bat 'docker run -d -p 8081:8080 --name cicd-demo cicd-demo'
    }
}
 stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f %K8S_DEPLOYMENT%'
                bat 'kubectl rollout status deployment/springboot-deployment'
            }
        }
    }

    post {
        success {
            echo "CI/CD Pipeline Finished ✅ App deployed to Kubernetes"
        }
        failure {
            echo "Pipeline Failed ❌ Check logs"
        }
    }
}
