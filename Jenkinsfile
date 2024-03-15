pipeline {
	agent any
	tools {
		maven "maven"
		jdk "jdk-17"
	}

	environment {
        registryCredential = 'ecr:us-east-1:awscreds'
        appRegistry = "754463572018.dkr.ecr.us-east-1.amazonaws.com/clouddemoapp"
		cloudappRegistry = "https://754463572018.dkr.ecr.us-east-1.amazonaws.com"
        cluster = "cloudapp"
		service = "cloudappsvc"
    }

	stages {
		stage('checkout') {
			steps {
				git branch: 'main', url: 'https://github.com/Earthyyy/cloud-cicd-with-jenkins.git'
			}
		}

		 stage('build') {
			 steps {
				 sh 'mvn install -DskipTests'
			 }

			 post {
				 success {
					 echo 'archiving artifacts now.'
					 archiveArtifacts artifacts: '**/cloud*.jar'
				 }
			 
			 }
		 }

		 stage('unit test') {
			 steps {
				 sh 'mvn test'
			 }
		 }

		 stage('checkstyle') {
			 steps {
				 sh 'mvn checkstyle:checkstyle'
			 }
		 }



		stage('sonarqube code analysis') {
				environment {
				scannerHome = tool 'sonar4.7'
				}
				steps {
					withSonarQubeEnv('sonar-latest') {
					sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=clouddemoapp \
					-Dsonar.projectName=clouddemoapp \
					-Dsonar.projectVersion=1.0 \
					-Dsonar.sources=src/ \
					-Dsonar.java.binaries=target/test-classes/ma/insea/clouddemoapp/ \
					-Dsonar.junit.reportPaths=target/surefire-reports/ \
					-Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
					}
				}
		}

		stage("quality gate") {
				steps {
					timeout(time: 1, unit: 'HOURS') {
						waitForQualityGate abortPipeline: true
					}
				}
		}

		stage('build app image') {
			steps {
			
				script {
						dockerImage = docker.build( appRegistry + ":$BUILD_NUMBER", ".")
					}

			}
    
    	}

		stage('push to ecr') {
			steps {
				script {
					docker.withRegistry( cloudappRegistry, registryCredential ) {
						dockerImage.push("$BUILD_NUMBER")
						dockerImage.push("latest")
					}
				}
			}
		}
		
		stage('deploy to ecs') {
		    steps {
		        withAWS(credentials: 'awscreds', region:'us-east-1') {
			        sh 'aws ecs update-service --cluster ${cluster} --service ${service} --force-new-deployment'
		        }
		    }
		    
	    }

	

		 
	
	}
}