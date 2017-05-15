FROM ubuntu:xenial

RUN apt-get update && apt-get install -y netcat net-tools curl npm vim git python python-pip python-dev libpq-dev
RUN pip install awscli

# Install docker client
RUN curl -L -o /tmp/docker-17.03.0-ce.tgz https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz
RUN tar -xz -C /tmp -f /tmp/docker-17.03.0-ce.tgz
RUN mv /tmp/docker/* /usr/bin

# Install docker compose
RUN curl -L https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

RUN psql -u postgres createuser -h localhost --superuser ubuntu sudo createdb -h localhost test_db
