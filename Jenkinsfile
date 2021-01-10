node {
  stage('Build') {
    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub_id') {
      def customImage = docker.build("scor2k/docker-multistage-golang:${Version}")
      customImage.push()
    }
  }
}
