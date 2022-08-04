pipeline{ 
	agent any
	stages {
		stage("Start")
		{
			sh 'echo "Started"'
		}
		stage("docker build image")
		{
			steps{
					script{
					
					dir("${env.WORKSPACE}") {
					docker.build('nehaghatage2626/angularhelloworld')
					
					}
				}
			}
		}

		stage("docker push image")
		{
			steps{
					script{
					withDockerRegistry(credentialsId: 'dockerhub') {
						docker.image('nehaghatage2626/angularhelloworld').push("latest")
						docker.image('nehaghatage2626/angularhelloworld').push("${BUILD_NUMBER}")
					}
					
				}
			}
		}
		
		stage("docker push image")
		{
			steps{
					script{
					sshPublisher(publishers: [sshPublisherDesc(configName: 'dev-server', 
								transfers: [sshTransfer(cleanRemote: false, excludes: '', 
								execCommand: './deploy.sh', execTimeout: 120000, 
								flatten: false, makeEmptyDirs: false, 
								noDefaultExcludes: false, 
								patternSeparator: '[, ]+', 
								remoteDirectory: '', remoteDirectorySDF: false, 
								removePrefix: '', sourceFiles: '')], 
								usePromotionTimestamp: false, 
								useWorkspaceInPromotion: false, verbose: false)])
					
					}
					
				}
			}
		}
		
}
}
