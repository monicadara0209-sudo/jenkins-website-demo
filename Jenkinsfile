
pipeline {
    agent any

    parameters {
        choice(
            name: 'DEPLOY_ENV',
            choices: ['Test', 'Demo'],
            description: 'Choose the deployment environment'
        )
    }

    environment {
        APP_NAME = 'jenkins-website-demo'
    }

    stages {
        stage('Build Website') {
            steps {
                echo "Building ${env.APP_NAME}"
                echo "Selected environment: ${params.DEPLOY_ENV}"

                bat 'if not exist build mkdir build'

                writeFile(
                    file: 'build/index.html',
                    text: '<html><body><h1>Hello from Jenkins!</h1><p>Deployment successful!</p></body></html>'
                )
            }
        }

        stage('Test Website') {
            steps {
                bat 'findstr /C:"Hello from Jenkins!" build\\index.html'
            }
        }

        stage('Deploy Website') {
            steps {
                bat 'if not exist deployed-site mkdir deployed-site'
                bat 'copy /Y build\\index.html deployed-site\\index.html'
                echo "Deployment to ${params.DEPLOY_ENV} completed"
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
        always {
            echo "Final build status: ${currentBuild.currentResult}"
        }
    }
}
