pipeline {
	   agent any
	   stages {
	      stage ('Run jmeter scripts on docker') {
	         
			  steps {
				sh '''
				    mkdir -p reports/jmeter
				    
				    ls -ltr
				   
                                   /usr/local/bin/docker build  -f docker/Dockerfile.jmeter -t Jmeter:3.3 .
				   ///usr/local/bin/docker run -i --rm  test:latest /bin/bash -c 'cat > /home/jmeter/MVP1.0MaxLTV.v2.jmx  && jmeter -n -t /home/jmeter/MVP1.0MaxLTV.v2.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter.csv 1>/dev/null && cat /home/jmeter/jmeter.csv' < tests/MVP1.0MaxLTV.v2.jmx > reports/jmeter/jmeter.cs
				  
				  
				  '''
				 // /usr/local/bin/docker run -i --rm  devopsraman/jmeter:3.3 /bin/bash -c 'cat > /home/jmeter/test.jmx && jmeter -n -t /home/jmeter/test.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter1.csv 1>/dev/null && cat /home/jmeter/jmeter1.csv' < tests/test.jmx > reports/jmeter/jmeter1.cs
				  ///usr/local/bin/docker run -i --rm  devopsraman/jmeter:3.3 /bin/bash -c 'cat > /home/jmeter/test2.jmx && jmeter -n -t /home/jmeter/test2.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter2.csv 1>/dev/null && cat /home/jmeter/jmeter2.csv' < tests/test2.jmx > reports/jmeter/jmeter2.cs
				  
				  
				  
				  archiveArtifacts 'reports/jmeter/**'
				  sh '''
				   /usr/local/bin/docker images |grep jmeter:3.3
				  /usr/local/bin/docker rmi -f jmeter:3.3
				  
				  '''
				  /*
				        TEST_REPORT_FOLDER="${JOB_NAME}-${BUILD_NUMBER}"
                                       mkdir -p /tmp/$TEST_REPORT_FOLDER/jmeter/
			                 /usr/local/bin/docker run -i --rm  devopsraman/jmeter:3.3 /bin/bash -c 'cat > /home/jmeter/MVP1.0MaxLTV.v2.jmx && jmeter -n -t /home/jmeter/MVP1.0MaxLTV.v2.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter.csv 1>/dev/null && cat /home/jmeter/jmeter.csv' < tests/MVP1.0MaxLTV.v2.jmx > reports/jmeter/jmeter.cs
					ls -la
                                       ls -la ${WORKSPACE}
                                      /usr/local/bin/docker run --rm -v /tmp/$TEST_REPORT_FOLDER/jmeter/:/tmp-jenkins -v ${WORKSPACE}:/jmeter_tests lazzurs/jmeter ls /jmeter_tests/
                                      /usr/local/bin/docker run --rm -v /tmp/$TEST_REPORT_FOLDER/jmeter/:/tmp-jenkins -v ${WORKSPACE}:/jmeter_tests lazzurs/jmeter jmeter -n -t /jmeter_tests/tests/MVP1.0MaxLTV.v2.jmx -l /jmeter_tests/tests/jmeter.jtl  
				 '''
                                */ 
                                 //archiveArtifacts '/tmp/$TEST_REPORT_FOLDER/jmeter//*'
				  // /usr/local/bin/docker run -i --rm lazzurs/jmeter /bin/bash -c 'cat > /MVP1.0MaxLTV.v2.jmx && jmeter -n -t /MVP1.0MaxLTV.v2.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /report.csv 1>/dev/null && cat /report.csv' < tests/MVP1.0MaxLTV.v2.jmx > reports/jmeter/report.cs
                                
			  }
		}
		
		 stage('publish Jmeter Report'){
			 steps {
			 // perfReport compareBuildPrevious: true, excludeResponseTime: true, modePerformancePerTestCase: true, modeThroughput: true, sourceDataFiles: '/Users/rthall/.jenkins/workspace/dockerjmeter2/tests/jmeter.jtl' 
			perfReport compareBuildPrevious: true, excludeResponseTime: true, modePerformancePerTestCase: true, modeThroughput: true, sourceDataFiles: ' reports/jmeter/** '	
			 hipchatSend color: 'YELLOW', credentialId: 'jenkinslogin', message: 'build sucess', notify: true, room: '', sendAs: '', server: '', textFormat: true, v2enabled: true
			 }
		 }
	   
	   
	 }
		   
	   
}
