FROM actionblocks/debian:jessie-slim

LABEL "com.github.actions.name"="Replicated Lint Action"
LABEL "com.github.actions.description"="Lint Replicated Releases"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/replicatedhq/replicated-action"
LABEL "homepage"="http://github.com/replicatedhq/replicated-action"
LABEL "maintainer"="Replicated <contact@replicated.com"

WORKDIR /tmp
ADD https://github.com/replicatedhq/replicated/releases/download/v0.9.0/replicated_0.9.0_linux_amd64.tar.gz /tmp/replicated_0.9.0_linux_amd64.tar.gz
RUN tar xzvf /tmp/replicated_0.9.0_linux_amd64.tar.gz
RUN install ./replicated /usr/local/bin

ADD . /action
WORKDIR /action
ADD ./entrypoint.sh /entrypoint.sh
