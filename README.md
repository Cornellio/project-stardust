Project Stardust
================

Purpose: The purpose of this exercise is to have you spin up a basic stack for a Java app. The idea is to see how you go about spinning this up and for you to come and talk about the HOW, so that we can understand your line of thought.

While you go through this exercise, think about scalability, maintainability, and other DevOps aspects of this deployment.

Exercise:

Create a Virtual Machine using Vagrant, then.

1>  Download & deploy the "Address book" Java app, from one of the two sources below, in Tomcat with Oracle JDK 7 release 79.

·      Links
http://docs.vagrantup.com/v2/getting-started/index.html
http://www.cumulogic.com/downloads/sample-applications/

2>  The JVM should listen on port 9000 which should *not* be directly accessible. The database port should also not be accessible.

3>  An Nginx web server should act as a front-end reverse proxy for the Java app.

4>  You should be able to access the Web app in your browser, and demo it.


Bonus:
======

1>  Use AWS for this exercise and sending the link to your app ahead of time.
2>  Checkin the code in github and send it ahead of time for review.
3>  Access the web app using a hostname, not IP address.
4>  Deploy multiple instances or apps behind a load balancer, each on a different port.
5>  Show any logging, monitoring or reliability tools added.
6>  Show any security & server hardening steps taken.
7>  Use further automation like Jenkins/Rundeck to run the demo.


Incremental Goals:
-----------------

Get a good foundation:
  * Get Puppet modules working √
  * Get sites manifest working with nodes definitions √
