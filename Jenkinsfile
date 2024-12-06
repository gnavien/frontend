pipeline {
    agent{
        node { label 'workstation'}
    }

    stages {

    stage('Build') {
            steps{
                echo 'Build'
            }
    }

    stage(' Unit Test') {
            steps{
                echo 'Unit Test'
                // sh 'npm test'
                //sh 'python -m unittest'
                //sh 'mvn test'
            }
    }
    stage('Code Analysis') {
            steps{
                echo 'sonar-scanner -Dsonar.host.url=http://sonarqube private ip:9000 -Dsonar.login=admin -Dsonar.password=admin123  -Dsonar.projectkey=cart'
            }

    }
    stage('Security Checks') {
            steps{
                echo 'Security Checks'
            }
    }
    stage('Publish a Artifact ') {
            steps{
                echo 'Publish a Artifact'
            }
    }
}