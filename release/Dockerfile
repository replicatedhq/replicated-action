FROM debian:jessie-slim

LABEL "com.github.actions.name"="Replicated Release Action"
LABEL "com.github.actions.description"="Promote releases to your Replicated application"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/replicatedhq/replicated-action"
LABEL "homepage"="http://github.com/replicatedhq/replicated-action"
LABEL "maintainer"="Replicated <contact@replicated.com"

RUN apt-get update -y && apt-get -y --no-install-recommends install ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
ADD https://github.com/replicatedhq/replicated/releases/download/v0.6.0/replicated_0.6.0_linux_amd64.tar.gz /tmp/replicated_0.6.0_linux_amd64.tar.gz
RUN tar xzvf /tmp/replicated_0.6.0_linux_amd64.tar.gz
RUN install ./replicated /usr/local/bin

ADD . /action
WORKDIR /action

ENTRYPOINT ["/action/entrypoint.sh"]
