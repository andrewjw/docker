FROM buildbot/buildbot-worker:v2.10.5

USER root
RUN echo "y\ny" | unminimize
RUN echo "tzdata tzdata/Areas select Europe" > /tmp/tzdata.txt && \
    echo "tzdata tzdata/Zones/Europe select London" >> /tmp/tzdata.txt && \
    debconf-set-selections /tmp/tzdata.txt && \
    rm -f /etc/timezone /etc/localtime && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get -y install ruby2.7 ruby2.7-dev rsync python3-pip docker.io
RUN gem install bundler
RUN chmod -R a+rwx /var/lib/gems/*
USER buildbot
RUN git config --global user.email $EMAIL
RUN git config --global user.name "Andrew Wilkinson"
