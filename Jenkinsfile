pipeline {
    agent any
  /*  environment {
        build_number = "${env.BUILD_ID}"
        AWS_ACCOUNT_ID="071892199962"
        AWS_DEFAULT_REGION="us-east-1"
        IMAGE_REPO_NAME="jenkins_node_ecr"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"

    }*/
    tools {
        maven 'maven' jfkj
    }
    stages {
        stage ('git repo') {
            steps {
                git branch: 'main', url: 'https://github.com/sreekanthpv12/k8_react_node_mongo-jenkins.git'
            }
        }
    /* stage('Build Docker Image') {
            steps {
                script {
                  sh ' docker build -t sreekanthpv12/nodebackend:v5.${build_number} .'
                  sh ' docker build -t sreekanthpv12/reactwebapp:v3.${build_number} .'
                  
                }
            }
        }
     stage('Deploy Docker Image') {
            steps {
                script {    
                withCredentials([string(credentialsId: 'sreekanthpv12', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u sreekanthpv12 -p ${dockerhubpwd}'
                   sh 'docker push sreekanthpv12/nodebackend:v5.${build_number}'
                  
                   
                    
                    
                  }
   
                    }
            }
    
    
        }
        
        stage('remove docker image from local') {
            steps {
                sh 'docker rmi -f sreekanthpv12/nodebackend:v5.${build_number} '
                sh 'docker rmi -f sreekanthpv12/reactwebapp:v3.${build_number} '
            }
        }
        
        stage('helmChart tag and  push to ECR') {
            steps {

                  sh "sed -i 's|sreekanthpv12/nodebackend:v5|sreekanthpv12/nodebackend:${build_number}|g' ./node-app-chart/values.yaml"
                 }
        }
        
        stage('helm package '){
            
            steps {
                sh "helm package node-app-chart"
            }
            
        }
        
        stage ('login to aws ') {
            steps {
             withCredentials([aws(credentialsId: 'ecr-credential', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        
                        
            sh "aws ecr get-login-password | helm registry login  --username AWS -p \$(aws ecr get-login-password --region us-east-1)  071892199962.dkr.ecr.us-east-1.amazonaws.com"
            }
         }
        }
        
         stage ('push helmchart to aws ecr ') {
            steps {
                withCredentials([aws(credentialsId: 'ecr-credential', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                sh "helm push node-app-chart-0.1.0.tgz oci://071892199962.dkr.ecr.us-east-1.amazonaws.com" 
            }
        }
        }
        
        stage('pull the  helm chart from ecr  and push to minikube ') {
            steps {
                script {
             
               
                 withCredentials([aws(credentialsId: 'ecr-credential', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        
                        
                    sh "helm pull ${ecrRepositoryUrl}/node-app-chart --version 0.1.0 --untar"
                    
                   sh "helm install node-app-chart node-app-chart "

                     
                    
                    
                  }
                   
                  }
                   
                 }
        }*/
        
    }
}
