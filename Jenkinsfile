pipeline{ 
	agent any
	stages {
		stage("checkout")
		{
			steps{
				checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nehapatil2326/angularHelloworld']]])
			}
		}
		stage("docker build image")
		{
			steps{
					script{
					
					dir("${env.WORKSPACE}") {
					docker.build('nehaghatage2626/angularhelloworld:${BUILD_NUMBER}')
					
					}
				}
			}
		}
		/*
		stage("docker push image")
		{
			steps{
					script{
					
					
				}
			}
		}*/
}
}
