# TODO: create base images from scratch
FROM ubuntu:18.04

COPY rootfs/ /
# just install a custom content
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -yq curl
