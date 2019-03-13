# Runtime environment for Blender+Hylang
# TODO: can I use alpine?
FROM debian:stretch

WORKDIR /tmp
COPY install.sh /tmp/install.sh
RUN ./install.sh

