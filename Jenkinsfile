pipeline {
    agent any

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
    }
}
