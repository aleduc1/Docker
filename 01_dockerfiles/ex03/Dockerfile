FROM ubuntu:16.04

EXPOSE 80 443 22

ENV PROTOCOL https

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

RUN echo "#!/bin/bash\n/opt/gitlab/embedded/bin/runsvdir-start &\necho \"external_url '$PROTOCOL://gitlab.exemple.fr'\" >> /etc/gitlab/gitlab.rb\ngitlab-ctl reconfigure\ntail -f /dev/null" > /root/script_start.sh && chmod +x /root/script_start.sh

ENTRYPOINT ["/root/script_start.sh"]
