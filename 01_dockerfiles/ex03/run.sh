#!/bin/bash

apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install \
    -y \
    curl \
    tzdata \
    apt-transport-https \
    ca-certificates \
    openssh-server \
    vim

export EXTERNAL_URL='http://gitlab.example.com'

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
apt-get install -y gitlab-ce

/opt/gitlab/embedded/bin/runsvdir-start &
EXTERNAL_URLl='localhost' && gitlab-ctl reconfigure
