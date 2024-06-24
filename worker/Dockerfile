FROM buildbot/buildbot-worker:v3.11.5

ARG EMAIL

USER root
RUN echo "y\ny" | unminimize
RUN echo "tzdata tzdata/Areas select Europe" > /tmp/tzdata.txt && \
    echo "tzdata tzdata/Zones/Europe select London" >> /tmp/tzdata.txt && \
    debconf-set-selections /tmp/tzdata.txt && \
    rm -f /etc/timezone /etc/localtime && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get -y install ruby2.7 ruby2.7-dev rsync python3-pip python3-venv docker.io nodejs sudo nano software-properties-common && \
    echo "buildbot ALL= NOPASSWD: /usr/bin/docker" >> /etc/sudoers
RUN sudo add-apt-repository ppa:deadsnakes/ppa
RUN sudo apt install -y python3.9 python3.10 python3.11
RUN sudo apt install -y python3.9-distutils python3.10-distutils python3.11-distutils
RUN sudo apt install -y python3.9-venv python3.10-venv python3.11-venv
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.9
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11
RUN gem install bundler
RUN chmod -R a+rwx /var/lib/gems/*
USER buildbot
RUN echo ${EMAIL} && git config --global user.email ${EMAIL}
RUN git config --global user.name "Andrew Wilkinson"
