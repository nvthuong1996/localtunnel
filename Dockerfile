FROM       ubuntu:18.04
MAINTAINER Aleksandar Diklic "https://github.com/rastasheep"

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse\n" > /etc/apt/sources.list
RUN apt-get update
COPY ./sshkey/authorized_keys /root/.ssh/
COPY ./sshkey/id_rsa /sshkey/id_rsa
COPY ./serveo /
COPY ./start.sh /
RUN chmod +x serveo
RUN chmod +x start.sh
EXPOSE 22

ENTRYPOINT ["./start.sh"]
CMD    ["/usr/sbin/sshd", "-D"]