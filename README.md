# NoteWorx README

A basic note application that uses a [ReactJS] frontend to capture and manage notes, an api written in [ExpressJS], and [MongoDB] to store notes.


Application is actually working on local system and by using command like as per ur provided ...

for react --  npm run serve:dev

and it will direct to the browser with address http://localhost:9000/ 


and for node -- npm run serve:api   and it will direct to the address   http://localhost:8000/api

and for mongodb   http://localhost:27017/ 
 
And for runing  this in a container here i have used docker as a containerization tool  
 
So befor that we need to exit from above 3 address such as 9000,8000,27017 

and for also stop the mongo 

sudosystemctl stop mongodb

and also we can check through command 

 ss -tunlp

if any port is working stop it 

i have created docker file for react and by creating the docker image i have used command like

 

  docker build  -t sreekanthpv12/reactwebapp:latest .
   
and for node   docker build -t sreekanthpv12/nodebackend: .

for mongodb we have already public images and as per the project i have used  mongo:3 as my image 

after successfully created image now we can run the container  

and for react  docker run -d -p 9000:9000 sreekanthpv12/reactwebapp 

node --  docker run -d -p 8000:8000 sreekanthpv12/nodebackend

for mongo  docker run -d -p 27017:27017 mongo:3


and also i have used docker-compose for running container  and  Docker Compose simplifies the management and deployment of multi-container applications by providing a convenient way to define, configure, and orchestrate the containers that make up the application stack. It promotes consistency, reproducibility, and scalability, making it easier to develop, test, and deploy complex applications using Docker.

so i have already created docker-compose.yaml file for that 

alternatively in a single command we can run our container

docker-compose up

and it will direct to localhost 9000 for front end ie react port and we can access our todo list application

And for Container Orchestration: Kubernetes provides powerful container orchestration capabilities, allowing you to manage and coordinate multiple containers across a cluster of machines. It handles container scheduling, scaling, load balancing, and automatic container recovery, making it easier to deploy and manage containerized applications at scale.

so that i have created directory name as kubernetes so in that contains my all yaml files

and also we need to check stop the docker container and also the port for that use to check command like 

ss -tunlp 

 and check for 9000,8000,27017
 
and for stoping docker-compose use docker-compose down command

after appliying kubernets yaml file like service deployment of mongo , node , react 

as per the yaml inside the directory kubernetes

as example kubectl apply -f mongodb-deployment.yaml

and check svc and pods 

and select pod name and do port forward command 

eg: 

kubectl port-forward mongodb-deployment-7978bcd85d-hwlft 27017:27017

kubectl port-forward reactwebapp-deployment-86f8b6d765-wckhp  9000:9000

kubectl port-forward nodebackend-deployment-7759cc886d-mjgx8  8000:8000

and also i have done svc clusterip to nodeport by kubectl patch command 

eg:
in react  kubectl patch svc reactwebapp-service  -p '{"spec": {"type": "NodePort"}}'

same like mongo and node .. and node port is for accessing port inside an organization

then we can access our application through our browser 

and also i had done ingress also in minikube cluster 

my ingress.yaml file is exixting same directory where kubernetes other yaml saved

and ingress will provide enterprice level load balancing 

by applying 

kubectl apply -f  ingress.yaml 

these are up to my task regarding deploying application in kubernetes in my case minikue 

and next i need to provide ci/cd and atlast deploy into my minikube  and these things i have done it on Jenkinsfile in this git hub  root directory 



