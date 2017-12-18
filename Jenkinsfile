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
                                      /usr/local/bin/docker run --rm -v /tmp/$TEST_REPORT_FOLDER/jmeter/:/tmp-jenkins -v ${WORKSPACE}:/jmeter_tests lazzurs/jmeter ls /jmeter_tests/
                                      /usr/local/bin/docker run --rm -v /tmp/$TEST_REPORT_FOLDER/jmeter/:/tmp-jenkins -v ${WORKSPACE}:/jmeter_tests lazzurs/jmeter jmeter -n -t /jmeter_tests/tests/MVP1.0MaxLTV.v2.jmx -l /jmeter_tests/tests/jmeter1.jtl  
				 '''
                                 
                                 //archiveArtifacts '/tmp/$TEST_REPORT_FOLDER/jmeter//*'
              
			  }
		}
		
		 stage('publish Jmeter Report'){
			 steps {
			  perfReport compareBuildPrevious: true, excludeResponseTime: true, modePerformancePerTestCase: true, modeThroughput: true, sourceDataFiles: '/Users/rthall/.jenkins/workspace/dockerjmeter2/tests/*.jtl' 
			//perfReport compareBuildPrevious: true, excludeResponseTime: true, modePerformancePerTestCase: true, modeThroughput: true, sourceDataFiles: '*.jtl' 	
			 }
		 }
		   
	 }
		   
	   
}
