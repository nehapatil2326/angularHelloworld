pipeline{ 
  agent any
  stages{
  stage('checkout'){
	checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nehapatil2326/angularHelloworld']]])
  }
  stage('Dockerbuild'){
	withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: '', usernameVariable: '')]) {
		sh "docker build ."
	}
  }
}
}
