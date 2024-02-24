pipeline
 {
   agent {
          docker {
            image 'timbru31/java-node:17-alpine-jre-18'
            args '-p 3000:3000 -u 0:0 --privileged'
			      reuseNode true
        }
   }

  stages { 
  
   stage('Install Dependencies'){
        steps{
            script{
                sh 'apk add --update --no-cache aws-cli jq'
            }
        }
    }

    
    stage('Npm install')
    {
      steps {
         script{
          echo "$WORKSPACE"
		    	sh 'npm install'

        }
      }
    }
   
    stage('Npm Build') {

          steps {
           sh 'npm run test'
          }
        }

      stage('S3 Upload') {
          steps {
           sh 'aws deploy push --application-name my-devsecops-test --s3-location s3://codedeploybucketnew.zip --source ./build'
          }
        }
		
// 	 stage('Sonar Analysis'){
//         steps{
//           script{
//             echo '=========================================================================================='
//              withSonarQubeEnv('sonarqube-demo') {
//               sh 'npx sonarqube-scanner'
//              }
//           }
//        }
//      }
//  stage("Quality Gate"){
// 	 steps
// 	 {
//         timeout(time: 1, unit: 'HOURS') {
//          script{
//            def qg = waitForQualityGate() 
//               if (qg.status != 'OK') {
//                 error "Pipeline aborted due to quality gate failure: ${qg.status}"
//            }
//          }
// 	  	}
// 	  }
//  }
// 	stage('SCA analysis') {
//         steps {
//                sh 'npx @cyclonedx/cyclonedx-npm --output-file src/bom.xml --validate'
//         }
//      }
// 	  stage('dependencyTrackPublisher') {
//             steps {
//                 withCredentials([string(credentialsId: 'sca-key', variable: 'API_KEY')]) {
//                     dependencyTrackPublisher artifact: 'src/bom.xml',
//                      projectName: 'My-React-Project', 
//                      projectVersion: 'my-version', 
//                      synchronous: true, 
//                      dependencyTrackApiKey: API_KEY
//                 }
//             }
//         }
    }
 }

		 
    