FROM ubuntu
MAINTAINER Bablish Jaiswal
#How to prevent ubuntu from being minimized
#RUN apt-get install apt-utils -y
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Asia/Kolkata DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt install tzdata -y && apt install net-tools vim man file -y
RUN yes| unminimize
RUN apt-get update -y && apt-get upgrade -y && apt-get install ubuntu-minimal ubuntu-server-minimal -y
RUN  apt-get install -y vim perl wget tar man sudo adduser netstat-nat net-tools curl w3m
RUN apt-get install ansible -y
RUN useradd -m  -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu && echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu
RUN chmod 044 /etc/sudoers.d/ubuntu
USER ubuntu:ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash"]
#docker run -itd --privileged #type_here_target_image_id /usr/sbin/init # command to run systemctl inside docker container
