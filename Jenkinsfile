pipeline {
    agent any
    // environment {
    //     AWS_ACCOUNT_ID="214732859252"
    //     AWS_DEFAULT_REGION="eu-west-3"
    //     IMAGE_REPO_NAME="jenkins_node_ecr"
    //     IMAGE_TAG="latest"
    //     REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"

    // }
    stages {
        stage('git repo') {
            steps {
                script {
                    git branch: 'main',
                       // credentialsId: 'kube11',
                        url: 'https://github.com/ouchayanRim/k-_MERN_Jenkins.git'
                }
            }
        }

        stage('Build Docker Image') {
                steps {
                    script {
                    sh ' docker build -t ouchayanr/nodebackend:v5.${BUILD_ID} . -f Dockerfile.node'
                    sh ' docker build -t ouchayanr/reactwebapp:v3.${BUILD_ID} .'
                    
                    }
                    
                }
        }
      /*  stage('Deploy Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub') {                  
                        sh 'docker push ouchayanr/nodebackend:v5.${BUILD_ID}'
                        sh 'docker push ouchayanr/reactwebapp:v3.${BUILD_ID}'
                    }
                }
            }
        }
        
        stage('remove docker image from local') {
            steps {
                sh 'docker rmi -f ouchayanr/nodebackend:v5.${BUILD_ID} '
                sh 'docker rmi -f ouchayanr/reactwebapp:v3.${BUILD_ID} '
            }
        }
        
        stage('helmChart tag ') {
            steps {

                  sh "sed -i 's|ouchayanr/nodebackend:v5|ouchayanr/nodebackend:v5.${BUILD_ID}|g' ./node-app-chart/values.yaml"
                     sh "sed -i 's|ouchayanr/reactwebapp:v5|ouchayanr/reactwebapp:v5.${BUILD_ID}|g' ./node-app-chart/values.yaml"

                 }
        }
        //  stage('Helm Install') {
        //     steps {
        //         script {
        //             // Ensure helm and kubectl are available
        //             sh 'helm version'
        //             sh 'kubectl version --client'
                    
        //             // Install the Helm chart in the Kubernetes cluster
        //             // sh 'helm install myapp ./node-app-chart --set image.tag=v5.${BUILD_ID}'
        //         }
        //     }
        // }    
        // stage('helm package '){
            
        //     steps {
        //         sh "helm package node-app-chart"
        //     }
            
        // }
        
        // stage ('login to aws ') {
        //     steps {
        //      withCredentials([aws(credentialsId: 'ecr-credential', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        
                        
        //     sh "aws ecr get-login-password | helm registry login  --username AWS -p \$(aws ecr get-login-password --region us-east-1)  071892199962.dkr.ecr.us-east-1.amazonaws.com"
        //     }
        //  }
        // }
        
        //  stage ('push helmchart to aws ecr ') {
        //     steps {
        //         withCredentials([aws(credentialsId: 'ecr-credential', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
        //         sh "helm push node-app-chart-0.1.0.tgz oci://071892199962.dkr.ecr.us-east-1.amazonaws.com" 
        //     }
        // }
        // }
        
        // stage('pull the  helm chart from ecr  and push to minikube ') {
        //     steps {
        //         script {
             
               
        //          withCredentials([aws(credentialsId: 'ecr-credential', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        
                        
        //             sh "helm pull ${ecrRepositoryUrl}/node-app-chart --version 0.1.0 --untar"
                    
        //            sh "helm install node-app-chart node-app-chart "

                     
                    
                    
        //           }
                   
        //           }
                   
        //          }
        // }*/
        
    }
}