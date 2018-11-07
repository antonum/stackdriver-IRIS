# stackdriver-IRIS
Integration of InterSystems IRIS to Google Stackdriver

## Installation

Assuming Stackdriver is already configured and IRIS is installed on GCP Compute instance

- Install Stackdriver Agent https://cloud.google.com/logging/docs/agent/installation
- Adjust with your specific paths and add to /etc/google-fluentd/config.d iris.conf file
- Restart stackdriver agent: sudo service google-fluentd restart

cconsole.log messages should appear under 'intersystems' tag in stackdriver logs
