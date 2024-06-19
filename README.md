# Homelab Configuration

This repository helps setting up my local homelab and its servers/ VMs.

## Setup Project

Create a new virtual environment to run Ansible in.

```bash
python3 -m venv .venv
```

The folder `.venv` is ignored by git already.

Activate the virtual environment.

```bash
source .venv/bin/activate
```

Install the required packages.

```bash
pip install ansible ansible-vault ansible-lint
```

Create a new vault password file.

```bash
echo "password" > .env/vault_pass
```

Test the ansible connection to the hosts.

```bash
ANSIBLE_CONFIG=./ansible/ansible.cfg ansible -m ping all --vault-password-file .env/vault_pass
```
