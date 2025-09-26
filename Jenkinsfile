pipeline {
    agent any

    stages {
        stage ('changing the file permission') {
            steps {
                sh ' chmod +x build.sh'
            }
        }

        stage('Build/Run/Push') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'docker-hub-creds',
            usernameVariable: 'DOCKER_USERNAME',
            passwordVariable: 'DOCKER_PASS'
        )]) {
            sh './build.sh'
        }
    }
}
