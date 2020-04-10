FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# File Author / Maintainer
MAINTAINER Marc Chisinevski

# Get pip to download and install requirements:
RUN microdnf update -y &&  microdnf -y install python3-pip && pip3 install https://releases.ansible.com/ansible-tower/cli/ansible-tower-cli-latest.tar.gz && awx --help
