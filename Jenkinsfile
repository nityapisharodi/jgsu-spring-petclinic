pipeline {
    agent any
    stages {
        stage ('Build Docker Image') {
            steps {
                sh 'docker build -t nityansp/petclinic:1.3 .'
            }
        }
        stage ('Run the container') {
            steps {
                sh 'docker run --name petclinic -dp 8081:8080 -v /var/run/docker.sock:/var/run/docker.sock nityansp/petclinic:1.3'
            }
        }
        stage ('Deploy'){
            steps {
                echo 'Deploying .....'
            }  
        }
   }
   
}