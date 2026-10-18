
pipeline {
    agent any

    stages {
        stage('Build Website') {
            steps {
                echo 'Building website...'
                bat 'if not exist build mkdir build'
                writeFile file: 'build/index.html',
                    text: '<html><body><h1>Hello from Jenkins!</h1><p>Deployed using Jenkins and Docker!</p></body></html>'
            }
        }

        stage('Test Website') {
            steps {
                bat 'findstr /C:"Hello from Jenkins!" build\\index.html'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'wsl -d Ubuntu -- docker build -t jenkins-website:v2 -f Dockerfile .'
            }
        }
    }

    post {
        success {
            echo 'Website and Docker image built successfully!'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}
