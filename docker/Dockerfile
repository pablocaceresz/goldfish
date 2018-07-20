FROM alpine:3.7

# Version of goldfish to install
ENV GOLDFISH_VERSION=v0.9.0 

# Directory to put Goldfish binary in

WORKDIR /app
ADD config.hcl /app/config.hcl
ADD entrypoint.sh /app/entrypoint.sh

# Install Goldfish binary and clean up
RUN apk --no-cache add \
        --virtual build-dependencies \
          unzip && \
    apk --no-cache add \
          curl \
          ca-certificates && \
          curl -L -o goldfish https://github.com/Caiyeon/goldfish/releases/download/$GOLDFISH_VERSION/goldfish-linux-amd64 && \
          chmod +x ./goldfish && \
          apk del build-dependencies

# if env var not defined, run in dev mode
# otherwise, create a local config file, and execute
ENTRYPOINT ["/app/entrypoint.sh"]
