# stackdriver-IRIS
Integration of InterSystems IRIS and Google Stackdriver

This projects allows for the following:
- Uptime check for IRIS instance
- cconsole.log exposed in StackDriver logs
- Information from System Dashboard http://<instance_public_ip>:57772/csp/sys/op/UtilDashboard.csp exposed to Stackdriver logs, so Log-based metrics can be implemented and monitored

## Installation

Assuming Stackdriver is already configured for the project and IRIS is installed on GCP Compute instance

### Uptime Check

Create uptime check in stachdriver for the following web page:

http://<instance_public_ip>:57772/csp/bin/Systems/Module.cxw

It takes up to 25 minutes for uptime stats to show up in StackDriver.

### Stackdriver agent

- Install Stackdriver Agent https://cloud.google.com/logging/docs/agent/installation

### cconsole.log

- Adjust with your specific paths and add to `/etc/google-fluentd/config.d` file `iris.conf`
- Restart stackdriver agent: `sudo service google-fluentd restart`

cconsole.log messages should appear under 'intersystems' tag in stackdriver logs


### IRIS Dashboard

- Load GCP.StackDriver class into %SYS namespace
- Test creation of the dashboard.log file:
`csession IRIS -U\%SYS "##class(GCP.StackDriver).DashboardToFile()"`
Check /usr/IRIS/mgr/dashboard.log file
- Adjust with your specific paths and add to `/etc/google-fluentd/config.d` file `irid-dashboard.conf`
- Restart stackdriver agent: `sudo service google-fluentd restart`
- Create cronjob to update dashboard stats every minute. Add the following line to crontab: 
`* * * * * csession IRIS -U\%SYS "##class(GCP.StackDriver).DashboardToFile()"`

## Uptime Check
![Uptime Check](https://github.com/antonum/stackdriver-IRIS/blob/master/images/uptime_check.png)
## Log
![Log](https://github.com/antonum/stackdriver-IRIS/blob/master/images/log.png)
## Dashboard
![Dashboard](https://github.com/antonum/stackdriver-IRIS/blob/master/images/dashboard.png)
