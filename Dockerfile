# Runtime environment for Blender+Hylang
# TODO: can I use alpine?
ARG BASEIMG=debian
ARG BASEVER=stretch

WORKDIR /tmp
COPY install.sh /tmp/install.sh
RUN ./install.sh

