pipeline {
  agent any

  stages {
    stage('Permissions') {
      steps {
        sh 'chmod +x build.sh'
      }
    }
    stage('Build/Run/Push') {
      steps {
        sh './build.sh'
      }
    }
  }
}

