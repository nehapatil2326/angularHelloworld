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
					dir("${env.WORKSPACE}") {
					docker.build('nehaghatage2626/AngularHelloworld')
					}
				}
		}
}
}
