FROM ubuntu:14.04
ENV HOME /root
WORKDIR /root

RUN apt-get update && \
    apt-get install -y \
      openssh-server

# Empty apt  folder
RUN rm -rf /var/lib/apt/lists/*

# Run folder ssh
RUN mkdir /var/run/sshd

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN mkdir /root/.ssh
ADD authorized_keys /root/.ssh/authorized_keys

# Define default command.
CMD ["bash"]


