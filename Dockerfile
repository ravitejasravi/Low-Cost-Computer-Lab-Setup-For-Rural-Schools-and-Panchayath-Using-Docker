FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN apt install python3 -y

RUN apt-get -y install python3-pip -y

RUN apt install g++ -y
 
RUN apt install default-jdk -y

RUN apt install vim -y

RUN apt-get update -y

RUN apt install mysql-server -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 siet-cloudlab 

RUN  echo 'siet-cloudlab:password' | sudo chpasswd

USER siet-cloudlab

COPY . .

RUN cp bashrc  ~/.bashrc

RUN . ~/.bashrc

USER root

RUN service ssh start

EXPOSE 3389 22 9001

CMD ["/usr/sbin/sshd","-D"]
