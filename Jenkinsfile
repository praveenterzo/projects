pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "praveensise/trend-app"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def tag = env.dev   // main or dev

                    sh """
                        docker build -t ${DOCKER_IMAGE}:${tag} .
                    """
                }
            }
        }

        stage('Push Image to Registry') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dckr_pat_Ik7lIFR8j9l22Qx7aWXUDD2b0fM', variable: 'TOKEN')]) {
                        sh """
                            echo "$TOKEN" | docker login -u praveensise --password-stdin
                            docker push ${DOCKER_IMAGE}:${env.BRANCH_NAME}
                        """
                    }
                }
            }
        }
    }
}