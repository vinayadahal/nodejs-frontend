pipeline {
    agent any

//     triggers {
//         githubPush()
//     }

    environment {
        DOCKERHUB_CREDENTIALS= credentials('docker-hub-credentials')
    }

    stages {

//        stage('Preparation') {
//             steps {
//                checkout scm
//            }
//        }
//     stage('Who am i?') {
//         echo "This job was triggered by a Git push to branch: ${env.BRANCH_NAME}"
//     }
//         stage('Checkout') {
//             steps {
//                 checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'git@github.com:vinayadahal/nodejs-frontend.git']]])
//             }
//         }

        stage('Docker Build') {
            steps {
                sh 'docker build -t bidahal/nodejs-front .'
            }
        }

        stage('Login to Docker Hub') {
            steps{
	            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
	            echo 'Login Completed'
            }
        }

        stage('Docker Push') {
            steps {
                script{
                    def branch_name=env.BRANCH_NAME
                    if (branch_name == "main") {
                        echo 'starting build ...'
                        sh 'docker build -t bidahal/nodejs-front .'
                    } else {
                        echo "skipping build $branch_name ..."
                    }
                }
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