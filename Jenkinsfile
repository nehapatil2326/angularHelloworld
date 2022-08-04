pipeline{ 
	agent any
  stages{
  
  stage('checkout scm')
  {
	checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nehapatil2326/angularHelloworld']]])
  }
  
  stage('Docker build Home')
  {
	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: '', usernameVariable: '')]) {
		sh "docker build ."
	}
  }
}
}
