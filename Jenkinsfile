pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'git@github.com:vinayadahal/nodejs-frontend.git']]])
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t bidahal/nodejs-front .'
            }
        }

        stage('Docker Push') {
            when {
                branch 'main'
            }
            steps {
                sh 'docker build -t bidahal/nodejs-front .'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
               echo 'testing deploy.'
            }
        }
    }
}