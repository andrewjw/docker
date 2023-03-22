FROM buildbot/buildbot-worker:v2.10.5

ARG EMAIL

USER root
RUN echo "y\ny" | unminimize
RUN echo "tzdata tzdata/Areas select Europe" > /tmp/tzdata.txt && \
    echo "tzdata tzdata/Zones/Europe select London" >> /tmp/tzdata.txt && \
    debconf-set-selections /tmp/tzdata.txt && \
    rm -f /etc/timezone /etc/localtime && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get -y install ruby2.7 ruby2.7-dev rsync python3-pip docker.io nodejs sudo nano && \
    echo "buildbot ALL= NOPASSWD: /usr/bin/docker" >> /etc/sudoers
RUN cat /etc/sudoers
RUN gem install bundler
RUN chmod -R a+rwx /var/lib/gems/*
USER buildbot
RUN echo ${EMAIL} && git config --global user.email ${EMAIL}
RUN git config --global user.name "Andrew Wilkinson"
