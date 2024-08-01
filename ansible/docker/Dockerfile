FROM alpine:3.19.1 as base

WORKDIR /ansible
COPY requirements_ansible.yaml /ansible/requirements_ansible.yaml
COPY requirements_python.txt /ansible/requirements_python.txt

RUN apk update && apk add --no-cache \
    ansible ansible-lint \
    openssh 

RUN pip install --no-cache-dir -r requirements_python.txt
RUN ansible-galaxy collection install -r requirements_ansible.yaml

FROM base 

WORKDIR /ansible≤
ENV ANSIBLE_CONFIG=/ansible/ansible.cfg
# mount volume first from project root (See README.md)!
# -v ./ansible:/ansible:ro
CMD [ "ansible-playbook", "homelab.yaml" ]