pipeline {
    agent any

    stages {
        stage('Checkout') {
    
                git 'https://github.com/seshuadi969/Borderless-Gaming.git'
            }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t borderless-gaming .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove old container if exists
                    sh 'docker rm -f borderless-gaming || true'

                    // Run new container
                    sh 'docker run -d -p 8080:5000 --name borderless-gaming borderless-gaming'
                }
            }
        }
    }
}
