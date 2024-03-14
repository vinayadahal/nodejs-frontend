pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS= credentials('docker-hub-credentials')
    }

    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t bidahal/nodejs-front .'
            }
        }
        stage('Docker Login and Push') {
            steps {
                script{
                    def branch_name=env.BRANCH_NAME
                    if (branch_name == "main") {
                        echo "Logging into docker hub and pushing the changes to 'main' tag"
                        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                        sh 'docker push bidahal/nodejs-front'
                    } else {
                        echo "Skipping docker login and push for feature branch: $branch_name..."
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script{
                    def branch_name=env.BRANCH_NAME
                    if (branch_name == "main") {
                        echo "Applying changes to the main k8s cluster"
                        sh 'kubectl apply -f k8s/deploy-frontend.yml'
                    } else {
                        echo "Skipping deploy for feature branch: $branch_name..."
                    }
                }
            }
        }
    }
}