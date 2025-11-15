pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "praveensise/prod"
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
                    def tag = env.main   // main or dev

                    sh """
                        docker build -t ${DOCKER_IMAGE}:${tag} .
                    """
                }
            }
        }

        stage('Push Image to Registry') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'docker_hub',
                        usernameVariable: 'DOCKERHUB_USER',
                        passwordVariable:  'DOCKERHUB_TOKEN'
                    )]) {
                        sh """
                          echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USER" --password-stdin
                            docker push ${DOCKER_IMAGE}:${env.BRANCH_NAME}
                        """
                    }
                }
            }
        }
    }
}
