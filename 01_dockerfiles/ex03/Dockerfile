FROM debian:jessie

EXPOSE 80 443 22

ENV EXTERNAL_URL http://0.0.0.0:4000

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install \
    -y \
	curl \
    apt-transport-https \
    ca-certificates \
    openssh-server \
    vim

RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

RUN apt-get install -y gitlab-ce
RUN gitlab-ctl reconfigure
RUN gitlab-ctl stop

ENTRYPOINT gitlab-ctl start
