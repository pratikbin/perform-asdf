# Base image
FROM alpine:3.14

# installes required packages for our script
RUN	apk add --no-cache bash ca-certificates make coreutils curl git

# Copies your code file  repository to the filesystem
COPY entrypoint.sh /entrypoint.sh

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
