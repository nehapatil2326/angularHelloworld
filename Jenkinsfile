pipeline{ 
	agent any
	stages {
		stage("Start")
		{	
			steps{
				sh 'echo "Started"'
			}
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
		
		stage("deploy DEV")
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
		
		stage("deploy QA")
		{
			steps{
					script{
					sshPublisher(publishers: [sshPublisherDesc(configName: 'QA', 
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
		
		stage("deploy PROD")
		{
			steps{
					script{
					sshPublisher(publishers: [sshPublisherDesc(configName: 'PROD', 
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
