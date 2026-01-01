pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Robot Suite') {
            steps {
                bat '''
                cd "%WORKSPACE%"
                call venv\\Scripts\\activate
                python -m robot -d Results Tests\\LinkIncidentToPeopleTestSuite.robot
                '''
            }
        }
    }

    post {
        always {
            robot outputPath: 'Results'
            archiveArtifacts artifacts: 'Results/**', fingerprint: true
        }

        failure {
            echo 'Robot tests failed'
        }

        success {
            echo 'Robot tests passed'
        }
    }
}
