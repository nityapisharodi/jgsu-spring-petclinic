pipeline {
    agent any
    stages {
        stage ('Build Docker Image') {
            steps {
                sh 'docker pull nityansp/petclinic:1.3'
            }
        }
        stage ('Run the container') {
            steps {
                sh 'docker run --name petclinic -dp 8081:8080 nityansp/petclinic:1.3'
            }
        }
        stage ('Deploy'){
            steps {
                echo 'Deploying .....'
            }  
        }
   }
   
}