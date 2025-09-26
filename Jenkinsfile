pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // Jenkins will checkout your repo automatically, but this is fine too
        git 'https://github.com/sudhirsshinde-sys/react-app-deployment-with-docker.git'
      }
    }

    stage('Permissions') {
      steps {
        sh 'chmod +x build.sh'
      }
    }

    stage('Build/Run/Push') {
      steps {
        // ⬇️ THIS is the "wrap": credentials get injected as env vars
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds',
                                          usernameVariable: 'DOCKER_USERNAME',
                                          passwordVariable: 'DOCKER_PASS')]) {
          sh './build.sh'
        }
      }
    }
  }
}

