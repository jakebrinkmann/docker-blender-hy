# Runtime environment for Blender+Hylang
# TODO: can I use alpine?
ARG BASEIMG=debian
ARG BASEVER=stretch

# -----------------------------------------------
# Build-layer to just compile su-exec from source
FROM $BASEIMG:$BASEVER as builder

# Install su-exec, to allow downgrading container
# privileges at runtime
# (note: doing here because docker-centric)
RUN apt-get update -y \
  && apt-get install -y git make gcc \
  && git clone https://github.com/ncopa/su-exec.git \
  && cd su-exec \
  && make all \
  && chmod +x su-exec \
  && mv su-exec /usr/bin/su-exec

WORKDIR /tmp
COPY install.sh /tmp/install.sh
RUN ./install.sh

