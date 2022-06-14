# TODO: create base images from scratch
FROM centos:centos7

RUN rm -rf /etc/yum.repos.d/*
COPY rootfs/ /
RUN curl http://artifactory-proxy/yum-ext-infra-centos-remote-cache/RPM-GPG-KEY-CentOS-7 -o /etc/yum.repos.d/RPM-GPG-KEY-CentOS-7
RUN rpm --import /etc/yum.repos.d/RPM-GPG-KEY-CentOS-7
RUN curl http://artifactory-proxy/yum-ext-infra-epel-remote-cache/RPM-GPG-KEY-EPEL-7 -o /etc/yum.repos.d/RPM-GPG-KEY-EPEL-7
RUN rpm --import /etc/yum.repos.d/RPM-GPG-KEY-EPEL-7
#RUN echo "ip_resolve=4" >> /etc/yum.conf
# just install a custom content
RUN yum install -y bash
