
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/seshuadi969/Borderless-Gaming.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t borderless-gaming .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d --name borderless-gaming-container borderless-gaming'
            }
        }
    }
}
