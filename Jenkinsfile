// Learning automatic builds

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building website'
                writeFile file: 'index.html',
                    text: '<html><body><h1>Hello from Jenkins!</h1></body></html>'
            }
        }

        stage('Test') {
            steps {
                bat 'findstr /C:"Hello from Jenkins!" index.html'
            }
        }

        stage('Deploy') {
            steps {
                bat 'if not exist deployed-site mkdir deployed-site'
                bat 'copy /Y index.html deployed-site\\index.html'
            }
        }
    }
}
