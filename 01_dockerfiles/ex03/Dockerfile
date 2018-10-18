# Go from a classic base image
FROM debian:latest

# 80 for http ; 443 for https ; 22 for ssh
EXPOSE 80 443 22

# ca certificate usefull for ssh certificate openssh-server for it. apt-transport-https is to allow apt to use https link
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install \
    -y \
    apt-transport-https \
    ca-certificates \
    openssh-server \
    vim
# small fix for SSH (that's harmless everywhere else)
RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd


