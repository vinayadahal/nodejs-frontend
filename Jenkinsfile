pipeline {
    agent any

    triggers {
        githubPush(branch: 'main') // Trigger pipeline on push to main branch
    }

    stages {
        stage('Checkout') {
            steps {
                git 'git@github.com:vinayadahal/nodejs-frontend.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t bidahal/nodejs-front' // Example Maven build step
            }
        }

        stage('Deploy') {
            steps {
                // Your deployment steps go here
               echo 'testing deploy' // Example Kubernetes deployment
            }
        }
    }
}
