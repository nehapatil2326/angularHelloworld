node { 

  stage 'checkout scm'
  checkout scm
  
  stage 'Docker build Home'
  dir("${env.WORKSPACE}") {
    docker.build('bvcuser/angularHelloworld')
    }

  stage 'Docker push Home'
  docker.withRegistry('', 'DockerHub') {
    docker.image('bvcuser/angularHelloworld').push("latest")
    docker.image('bvcuser/angularHelloworld').push("${BUILD_NUMBER}")
  }
  /*
  stage('Remove Unused docker image') {
  sh "docker rmi --force \$(docker images -q 'bvcuser/campaignbirdweb' | uniq)"
  }*/
}
