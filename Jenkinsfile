pipeline {
	   agent any
	   stages {
	      stage ('Run jmeter scripts on docker') {
	         
			  steps {
				  sh '''
				        TEST_REPORT_FOLDER="${JOB_NAME}-${BUILD_NUMBER}"
                                        mkdir -p /tmp/$TEST_REPORT_FOLDER/jmeter/
                                       /usr/local/bin/docker run -dit  --name master  lazzurs/jmeter  -v /tmp/$TEST_REPORT_FOLDER/jmeter/:/tmp-jenkins -v ${WORKSPACE}:/jmeter_tests jmeter -n -t /jmeter_tests/tests/MVP1.0MaxLTV.v2.jmx -l /tmp/$TEST_REPORT_FOLDER/jmeter/   
				       /usr/local/bin/docker exec -i master /bin/bash -c jmeter -n -t /jmeter_tests/tests/MVP1.0MaxLTV.v2.jmx -l /tmp/$TEST_REPORT_FOLDER/jmeter/  
				        archiveArtifacts "/tmp/$TEST_REPORT_FOLDER/jmeter/**"
              
				   '''
				
				// /usr/local/bin/docker exec -i master /bin/bash -c jmeter -n -t /jmeter_tests/tests/MVP1.0MaxLTV.v2.jmx -l /tmp/$TEST_REPORT_FOLDER/jmeter/    
                                  
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
