pipeline {
    agent any
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/khadar099/automation-to-k8s.git']]])
                sh 'mvn clean install'
            }
        }
        stage('Reading files from repo') {
            steps {
                script {
                  def datas = readYaml file: 'config.yml'
                }
            }
        }
        stage ('Docker Build Stage') {
            steps {
                script {
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
