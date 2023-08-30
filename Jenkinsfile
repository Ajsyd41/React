pipeline
 {
    agent {
          docker {
                  image 'node:16-alpine'
                  reuseNode true
         }
      }
	  
  stages {
  
    stage('Build') {
      steps {
       sh 'npx i'
      }
    }
    stage('Unit Test') {
          steps {
           sh 'npx run test'
            junit 'coverage/junit.xml'
          }
        }
	 stage('Sonar Analysis')
     {
        steps
        {
            script
            {
             withSonarQubeEnv('sonarqube-demo') {
                sh 'npx sonarqube-scanner'
            }
        }
     }
     }
     stage("Quality Gate"){
	 steps
	 {
        timeout(time: 1, unit: 'HOURS') {
         script{
           def qg = waitForQualityGate() 
              if (qg.status != 'OK') {
                error "Pipeline aborted due to quality gate failure: ${qg.status}"
           }
         }
		}
	  }
     }
	stage('SCA analysis') {
        steps {
               sh 'npx @cyclonedx/cyclonedx-npm --output-file src/bom.xml --validate'
        }
     }
	  stage('dependencyTrackPublisher') {
            steps {
                withCredentials([string(credentialsId: 'sca-key', variable: 'API_KEY')]) {
                    dependencyTrackPublisher artifact: 'target/bom.xml', projectName: 'My-Maven-Project', projectVersion: 'my-version', synchronous: true, dependencyTrackApiKey: API_KEY
                }
            }
        }
    }
	post {
        always {
            cleanWs()
        }
    }
}  
		 
    