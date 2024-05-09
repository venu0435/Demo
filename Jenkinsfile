pipeline
{
    agent any

stages{
    stage('Git Checkout'){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Github-Credentials', url: 'https://github.com/venu0435/Demo.git']])
                    
                }
            }
    }
    stage('Maven build') {
            
            steps {
                
                script{
                    
                    sh 'mvn clean install'
                }
            }
        }
        
     stage ('Docker Build Stage') {
            steps {
                script {
                    sh 'docker build -t $JOB_NAME:v1.$BUILD_ID .'
                    sh 'docker tag $JOB_NAME:v1.$BUILD_ID venubollu0435/$JOB_NAME:v1.$BUILD_ID'
                }
            }
        }
        stage ('push docker image to  dockerhub') {
            steps {
                script {
           //withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', passwordVariable: 'dockerhub-pwd', usernameVariable: 'dockerhub-uname'), 
                   //withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', passwordVariable: 'dockerhub-pwd', usernameVariable: 'dockerhub-uname')]) {
                    withCredentials([string(credentialsId: 'docker-pswd', variable: 'dckr-hb-pswd')]) {    
                        sh 'docker login -u venubollu0435 -p P@99W0rd@!'
                        sh 'docker push venubollu0435/$JOB_NAME:v1.$BUILD_ID'
                       // sh 'docker rmi venubollu0435/$JOB_NAME:v1.$BUILD_ID'
                       // sh 'docker run  -d -p 9292:8080 venubollu0435/$JOB_NAME:v1.$BUILD_ID'
                        }
                    }
                }
    }
    
         stage('deploy docker image'){
            steps {
                script {
                sh '''
                ssh -tt ubuntu@43.204.141.30 -o StrictHostKeyChecking=no << 'EOF'
                docker run -d -p 9292:8080 venubollu0435/javaapplication:v1.26
                
                exit
                
                '''
                }
            }
        }
}
}
}

}

