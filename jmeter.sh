

/usr/local/bin/docker run -i --rm  nbs/jmeter /bin/bash -c 'cat > /home/jmeter/MVP1.0MaxLTV.v2.jmx  && jmeter -n -t /home/jmeter/MVP1.0MaxLTV.v2.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter.csv 1>/dev/null && cat /home/jmeter/jmeter.csv' < tests/MVP1.0MaxLTV.v2.jmx > reports/jmeter/jmeter.cs
/usr/local/bin/docker run -i --rm  devopsraman/jmeter:3.3 /bin/bash -c 'cat > /home/jmeter/test.jmx && jmeter -n -t /home/jmeter/test.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter1.csv 1>/dev/null && cat /home/jmeter/jmeter1.csv' < tests/test.jmx > reports/jmeter/jmeter1.cs
/usr/local/bin/docker run -i --rm  devopsraman/jmeter:3.3 /bin/bash -c 'cat > /home/jmeter/test2.jmx && jmeter -n -t /home/jmeter/test2.jmx -DTESTHOST=nbs-mortgages-remo-webapp.dev.mortgages.nationwide.co.uk -l /home/jmeter/jmeter2.csv 1>/dev/null && cat /home/jmeter/jmeter2.csv' < tests/test2.jmx > reports/jmeter/jmeter2.cs
