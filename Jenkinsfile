pipeline {
	   agent any
	   stages {
	      stage ('Run jmeter scripts on docker') {
	         
			  steps {
				  sh '''
				        TEST_REPORT_FOLDER="${JOB_NAME}-${BUILD_NUMBER}"
                                       mkdir -p /tmp/$TEST_REPORT_FOLDER/jmeter/
                                       ls -la
                                       ls -la ${WORKSPACE}
                    docker run --rm -v /tmp/$TEST_REPORT_FOLDER/jmeter/:/tmp-jenkins -v ${WORKSPACE}:/jmeter_tests lazzurs/jmeter ls /jmeter_tests/
                    docker run --rm -v /tmp/$TEST_REPORT_FOLDER/jmeter/:/tmp-jenkins -v ${WORKSPACE}:/jmeter_tests lazzurs/jmeter jmeter -n -t /jmeter_tests/tests/Performance/Tests/simple.jmx -DTESTHOST=nbs-banking-webapp-dpv.dev.banking.hubs.thenbs.io
                '''
                archiveArtifacts "/tmp/$TEST_REPORT_FOLDER/jmeter/**"/**"
              
				   '''
				
				
                                  
			  }
		}
		
		 stage('publish Jmeter Report'){
			 steps {
			   perfReport compareBuildPrevious: true, excludeResponseTime: true, modePerformancePerTestCase: true, modeThroughput: true, sourceDataFiles: '/tmp/*.jtl'
				 sh ''' 
				       rm -rf /tmp/*.jtl 
				       /usr/local/bin/docker stop master 
				       /usr/local/bin/docker rm master
				  '''
			 }
		 }
		   
	 }
		   
	   
}
