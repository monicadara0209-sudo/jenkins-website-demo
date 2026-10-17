
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Getting project files from GitHub'
            }
        }

        stage('Build') {
            steps {
                echo 'Building website'
                bat 'if not exist build mkdir build'
                bat 'copy /Y index.html build\\index.html'
            }
        }

        stage('Test') {
            steps {
                bat 'findstr /C:"Hello from Jenkins!" build\\index.html'
            }
        }

        stage('Deploy') {
            steps {
                bat 'if not exist deployed-site mkdir deployed-site'
                bat 'copy /Y build\\index.html deployed-site\\index.html'
            }
        }
    }

    post {
        success {
            echo 'Build, test and deployment completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}
