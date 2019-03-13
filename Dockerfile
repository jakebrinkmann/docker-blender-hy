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

# --------------------------------------------------
# Final runtime environment
FROM $BASEIMG:$BASEVER
COPY --from=builder /usr/bin/su-exec /usr/bin/su-exec

# Install some required build tools
RUN apt-get update -y \
  && apt-get install -y sudo

# Create a super-user, name which defaults to udocker
ARG SUPER_USERNAME=udocker
RUN useradd -m $SUPER_USERNAME -u 1000 -s /bin/bash \
  && echo "$SUPER_USER_NAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/$SUPER_USERNAME \
  && chmod 0440 /etc/sudoers.d/$SUPER_USERNAME

# Install our required tools/libraries
WORKDIR /tmp
COPY install.sh .
RUN ./install.sh \
  && rm -rf /tmp/*

# Work out of a known location in /opt
# (expectation that source code will be mounted
#  read-only into here)
WORKDIR /opt/blender-hy
ENV SUPER_USERNAME=$SUPER_USERNAME
ENTRYPOINT [ "su-exec", "$SUPER_USERNAME:1000", "hy", "hello-world.hy" ]
