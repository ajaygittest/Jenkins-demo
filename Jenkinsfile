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
    }
}
