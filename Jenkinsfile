pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('Preparation') {
             steps {
                checkout scm
            }
        }
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

        stage('Docker Push') {
            steps {
                sh """
                    if [ \${env.BRANCH_NAME}=="main" ]
                    then
                      echo "starting build for main ..."
                      docker build -t bidahal/nodejs-front .
                    else
                      echo "skipped build for main..."
                    fi
                """
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