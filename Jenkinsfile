pipeline {
    agent any
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/khadar099/automation-to-k8s.git']]])
                sh 'mvn clean install'
            }
        }
        stage ('Docker Build Stage') {
            steps {
                script {
                    def yaml = readYaml file: 'config.yaml'
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('docker image push') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
    }
}
