pipeline {
    agent any

    environment {
        EMAIL_RECIPIENTS = 'praveenpkitc@gmail.com'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/praveenterzo/projects.git', branch: 'dev'
            }
        }

        stage('Run Script') {
            steps {
                 sh 'chmod +x modify.sh'; 
                 sh './modify.sh'
            }
        }
    }

    post {
        success {
            mail to: "${EMAIL_RECIPIENTS}",
                 subject: "✅ Jenkins Build #${BUILD_NUMBER} - SUCCESS",
                 body: "The build was successful.\n\nCheck it here: ${BUILD_URL}"
        }
        failure {
            mail to: "${EMAIL_RECIPIENTS}",
                 subject: "❌ Jenkins Build #${BUILD_NUMBER} - FAILED",
                 body: "The build failed.\n\nCheck it here: ${BUILD_URL}"
        }
    }
}
