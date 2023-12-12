pipeline {
    agent any
    environment {
        config = readYaml file: "config.yaml"
    }
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
                    dockerImage = docker.build registry
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
