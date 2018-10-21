FROM ubuntu:16.04

EXPOSE 80 443 22

ENV PROTOCOL http

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install \
    -y \
	curl \
	tzdata \
    apt-transport-https \
    ca-certificates \
    openssh-server \
    vim

RUN	curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
RUN	apt-get install -y gitlab-ce

RUN echo "#!/bin/bash\n/opt/gitlab/embedded/bin/runsvdir-start &\necho \"external_url '$PROTOCOL://gitlab.exemple.fr'\" >> /etc/gitlab/gitlab.rb\ngitlab-ctl reconfigure\n/etc/init.d/ssh start\ngitlab-ctl tail" > /root/script_start.sh && chmod +x /root/script_start.sh

ENTRYPOINT ["/root/script_start.sh"]

# docker build -t gitlab42:try .
# docker run --rm -it --privileged -p 80:80 -p 443:443 -p 3000:22 --name gitlab-ce gitlab42:try
# Modify PROTOCOL for http or https
# Add ~/.ssh/id_rsa.pub to gitlab
# Clean known_host if needed
# git clone http://192.168.99.100/root/project.git
# git clone ssh://git@192.168.99.100:3000/root/project.git
# Clean cache
