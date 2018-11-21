# stackdriver-IRIS
Integration of InterSystems IRIS to Google Stackdriver

## Installation

Assuming Stackdriver is already configured and IRIS is installed on GCP Compute instance

- Install Stackdriver Agent https://cloud.google.com/logging/docs/agent/installation
- Load GCP.StackDriver class into %SYS namespace
- Adjust with your specific paths and add to /etc/google-fluentd/config.d iris.conf, irid-dashboard.conf files
- Restart stackdriver agent: sudo service google-fluentd restart
- Add the following line to crontab: * * * * * csession IRIS -U\%SYS "##class(GCP.StackDriver).DashboardToFile()"
cconsole.log messages should appear under 'intersystems' tag in stackdriver logs
