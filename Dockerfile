FROM openshift/jenkins-2-centos7

# Jenkins image for OpenShift
#
# This image extends the base jen Jenkins server, primarily intended for integration with
# OpenShift v3.
#
# Volumes:
# * /var/jenkins_home
# Environment:
# * $JENKINS_PASSWORD - Password for the Jenkins 'admin' user.

MAINTAINER Stefano Lingueri <slinguer@redhat.com>

USER root

# Install packages 
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y install python-pip && \
    yum -y install java-1.7.0-openjdk-headless.x86_64 && \
    yum -y install python-devel.x86_64 && \
    yum -y install libxml2-devel.x86_64 && \
    yum -y install libxslt-devel.x86_64 && \
    yum -y install zlib.x86_64 gcc.x86_64
RUN pip install bzt  && \
    pip install virtualenv