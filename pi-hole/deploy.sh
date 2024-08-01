#!/bin/bash

BASE=$(dirname "$(realpath "$0")")/..

ANSIBLE_DIR=$BASE/ansible
ENV_DIR=$ANSIBLE_DIR/.env
PLAYBOOKS_DIR=$BASE/pi-hole/playbooks


GLOBAL_VARS=$ANSIBLE_DIR/global_vars.yaml

ANSIBLE_CONFIG=$ANSIBLE_DIR/ansible.cfg ansible-playbook "$PLAYBOOKS_DIR/deploy.yaml" \
  -i "$BASE/pi-hole/inventory/hosts.yaml" \
  -i "$BASE/pve/inventory/hosts.yaml" \
  --private-key="$ENV_DIR/ssh.key" \
  --vault-password-file="$ENV_DIR/vault_pass" \
  --extra-vars "@$GLOBAL_VARS"