Project Stardust
================

This is a sample project for spinning up a basic stack for a Java app.

The stack features:

* Vagrant with Puppet provisioning
* Tomcat with Oracle JDK
* MySQL Server
* The sample Java Address Book app, *Granny* from [cumulogic](http://www.cumulogic.com/downloads/sample-applications/)
* An Nginx front-end web server

Two systems are configured in the Vagrantfile:

 `app01.stardust.net` - The applicaiton server running the Address Book app on Tomcat. Mysql server also runs here.

`deployer.stardust.net` - A bare Tomcat server for hosting Jenkins CI. This is used for doing deployments to `app01`. The deployment job is not automatically configured. To setup Jenkins, drop a jenkins.war package into `/opt/tomcat/webapps`. Jenkins will be running on port 8080.

## Setup

The app server can be tested on its own without using Jenkins for deployment. To do so just deploy the app server:

`vagrant up app01`

Then create a hosts entry `www.stardust.net` for IP `172.21.10.2` and access the app in your browser at http://www.stardust.net/granny/

If you run `vagrant up` without specifying a host name both systems will be provisioned, but as noted above Jenkins requires additional setup before it can deploy war files to the app server.


*In memory of David Bowie*
