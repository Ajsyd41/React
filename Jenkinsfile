pipeline
 {
    agent {
          docker {
            image 'node:18.17.1-alpine3.18'
            args '-p 3000:3000'
			reuseNode true
        }
	}      
  stages {
  
    stage('Build') {
      steps {
        script{
	    sh 'chown -R $USER /usr/local/lib/node_modules'
      sh 'npm install'
        }
      }
    }
    stage('Unit Test') {
          steps {
           sh 'npm run test'
            junit 'coverage/junit.xml'
          }
        }
		
	//  stage('Sonar Analysis'){
  //       steps{
  //            withSonarQubeEnv('sonarqube-demo') {
  //               sh 'npx sonarqube-scanner'
  //           }
        
  //      }
  //    }
  //    stage("Quality Gate"){
	//  steps
	//  {
  //       timeout(time: 1, unit: 'HOURS') {
  //        script{
  //          def qg = waitForQualityGate() 
  //             if (qg.status != 'OK') {
  //               error "Pipeline aborted due to quality gate failure: ${qg.status}"
  //          }
  //        }
	// 	}
	//   }
  //    }
	// stage('SCA analysis') {
  //       steps {
  //              sh 'npx @cyclonedx/cyclonedx-npm --output-file src/bom.xml --validate'
  //       }
  //    }
	//   stage('dependencyTrackPublisher') {
  //           steps {
  //               withCredentials([string(credentialsId: 'sca-key', variable: 'API_KEY')]) {
  //                   dependencyTrackPublisher artifact: 'target/bom.xml', projectName: 'My-Maven-Project', projectVersion: 'my-version', synchronous: true, dependencyTrackApiKey: API_KEY
  //               }
  //           }
  //       }
    }
	post {
        always {
            cleanWs()
        }
    }
}  
		 
    