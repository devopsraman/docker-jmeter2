pipeline {
	   agent any
	   stages {
	      stage ('Run jmeter scripts on docker') {
	         
			  steps {
				sh '''
				    mkdir -p reports/jmeter
				    
				    ls -ltr
				   				   
				  /var/lib/docker version
                                    /usr/bin/docker build  -f docker/Dockerfile.jmeter -t abc/jmeter .
				    /usr/bin/docker images |grep abc/jmeter
				   /usr/bin/docker run -i --rm  abc/jmeter /bin/bash -c 'cat > /home/jmeter/MVP1.0MaxLTV.v2.jmx  && jmeter -n -t /home/jmeter/MVP1.0MaxLTV.v2.jmx -DTESTHOST=www.google.com -l  /home/jmeter/jmeter.csv 1>/dev/null && cat /home/jmeter/jmeter.csv' < tests/MVP1.0MaxLTV.v2.jmx > reports/jmeter/jmeter.cs
				  
				 ls -ltr
				 chmod 777 jmeter.sh
				 # ./jmeter.sh
				  '''
				 // /usr/local/bin/docker run -i --rm  --cpus="2"  --memory=2g devopsraman/jmeter:3.3 /bin/bash -c 'cat > /home/jmeter/test.jmx && jmeter -n -t /home/jmeter/test.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter1.csv 1>/dev/null && cat /home/jmeter/jmeter1.csv' < tests/test.jmx > reports/jmeter/jmeter1.cs
				  ///usr/local/bin/docker run -i --rm  devopsraman/jmeter:3.3 /bin/bash -c 'cat > /home/jmeter/test2.jmx && jmeter -n -t /home/jmeter/test2.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter2.csv 1>/dev/null && cat /home/jmeter/jmeter2.csv' < tests/test2.jmx > reports/jmeter/jmeter2.cs
				  
				  //ls -ltr
				 // chmod 777 jmeter.sh
				  //./jmeter.sh
				  
				  //archiveArtifacts 'reports/jmeter/**'
				  
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
		
		 stage('publish Jmeter Report & Clean jmeter Image'){
			 steps {
			 // perfReport compareBuildPrevious: true, excludeResponseTime: true, modePerformancePerTestCase: true, modeThroughput: true, sourceDataFiles: '/Users/rthall/.jenkins/workspace/dockerjmeter2/tests/jmeter.jtl' 
			archiveArtifacts 'reports/jmeter/**'
			//perfReport compareBuildPrevious: true, excludeResponseTime: true, modePerformancePerTestCase: true, modeThroughput: true, sourceDataFiles: ' reports/jmeter/** '	
			perfReport compareBuildPrevious: true, constraints: [[$class: 'AbsoluteConstraint', escalationLevel: 'INFORMATION', meteredValue: 'AVERAGE', operator: 'NOT_GREATER', relatedPerfReport: 'jmeter1.cs', success: false, value: 0], [$class: 'RelativeConstraint', escalationLevel: 'ERROR', meteredValue: 'ERRORPRC', operator: 'NOT_GREATER', previousResultsBlock: [previousResultsString: '50', value: 'true'], relatedPerfReport: 'jmeter1.cs', success: false, tolerance: 0.0], [$class: 'RelativeConstraint', escalationLevel: 'ERROR', meteredValue: 'AVERAGE', operator: 'NOT_GREATER', previousResultsBlock: [previousResultsString: '50', value: 'true'], relatedPerfReport: 'jmeter1.cs', success: false, tolerance: 0.0]], ignoreFailedBuilds: true, ignoreUnstableBuilds: true, modeEvaluation: true, modePerformancePerTestCase: true, modeThroughput: true, persistConstraintLog: true, sourceDataFiles: 'reports/jmeter/**'
			
			
			//hipchatSend color: 'YELLOW', credentialId: 'jenkinslogin', message: 'build sucess', notify: true, room: '', sendAs: '', server: '', textFormat: true, v2enabled: true
			 
				 sh '''
				   
				 # tar -zcvf Jmeter-Report-${JOB_NAME}-${BUILD_NUMBER}.tar.gz reports/
				  ls -ltr
			          
				 /usr/local/bin/docker images |grep abc/jmeter
				  /usr/local/bin/docker images 
			
				  '''
			     //  /usr/local/bin/docker images |grep nbs/jmeter
				//  /usr/local/bin/docker rmi -f nbs/jmeter
			 
			 }
		 }
	   
	   
	 }
		   
	   
}
