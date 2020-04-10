ubicontainer=$(buildah from registry.access.redhat.com/ubi8/ubi-minimal:latest)
export CONTAINER_FS=$(buildah mount)
buildah run $ubicontainer microdnf update -y && \
buildah run $ubicontainer microdnf  install python3-pip -y && \
buildah run $ubicontainer  pip3 install https://releases.ansible.com/ansible-tower/cli/ansible-tower-cli-latest.tar.gz && \
buildah config --cmd /bin/bash ${ubicontainer} && \
buildah run $ubicontainer -- sh -c "awx --help"
