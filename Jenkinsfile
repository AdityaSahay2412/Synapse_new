pipeline {
    agent any

    stages {
        stage('Run Robot Suites in Parallel') {
            parallel {
                stage('Link Incident Suite') {
                    steps {
                        bat '''
                        call venv\\Scripts\\activate
                        python -m robot -d Results\\LinkIncident Tests\\LinkIncidentToPeopleTestSuite.robot
                        '''
                    }
                }

                stage('Login Suite') {
                    steps {
                        bat '''
                        call venv\\Scripts\\activate
                        python -m robot -d Results\\DataComparison Tests\\SharedDataComparisonTestSuite.robot
                        '''
                    }
                }
            }
        }
    }
}
