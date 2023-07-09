pipeline
 {
  agent any

  tools {
    nodejs 'NodeJS'
  }

  stages {
    stage('Preflight') {
      steps {
       bat 'node -v'
       bat 'npm --version'
       bat 'git log --reverse -1'
      }
    }

    stage('Build') {
      steps {
       bat 'npm install'
      }
    }
    stage('Unit Test') {
          steps {
           bat 'npm run test'
            junit 'coverage/junit.xml'
          }
        }
  
   stage('Sonarqube') {
      environment{
      def scannerHome = tool 'sonarqube_scanner';
      }
      steps{
          withSonarQubeEnv('sonar_api'){
             bat "${scannerHome}/bin/sonar-scanner"          
        }
      }
   }

    stage('Delete Project Files') {
      steps {
        cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true)
      }
    }
  }
}