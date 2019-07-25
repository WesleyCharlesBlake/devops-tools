# Devops Docker image

[![CircleCI](https://circleci.com/gh/WesleyCharlesBlake/devops-tools.svg?style=svg)](https://circleci.com/gh/WesleyCharlesBlake/devops-tools)

A Docker image with the following installed: 
- [Packer](https://www.packer.io/)
- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)

The versions of the binarys are defined by environment variables, so bumping up versions of packer/terraform or ansible is handled in one place:

```
ENV ANSIBLE_VERSION=2.8.1
ENV PACKER_VERSION=1.4.2
ENV TERRAFORM_VERSION=0.12.5
```

To run a playbook using this image, you will bind mount your directory in `/devops`

eg:

```bash
# ansible example
docker run  -v $PWD:/devops wesleycharlesblake/devops-tools ansible-playbook playbook.yml --check

# terraform example
docker run  -v $PWD:/devops wesleycharlesblake/devops-tools terraform plan

# packer example
docker run  -v $PWD:/devops wesleycharlesblake/devops-tools packer validate packer.json
```
