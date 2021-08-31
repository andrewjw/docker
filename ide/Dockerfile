FROM theiaide/theia:1.17.0

USER root
RUN apk add ruby ruby-dev ruby-bundler python3 py3-pip sudo gcc g++ make libc-dev openssl-dev
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/wheel
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
RUN adduser theia wheel
USER theia
