FROM python:2.7

ENV ANSIBLE_VERSION=2.4.2.0
ENV PACKER_VERSION=1.2.2
ENV TERRAFORM_VERSION=0.11.7

RUN apt-get update && \
    apt-get install  -y unzip python-apt

# install ansible
RUN pip install ansible==${ANSIBLE_VERSION}

# get packer binary
RUN curl -o packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip

# get terraform binary
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# set packer perms
RUN unzip packer.zip
RUN mv packer /usr/local/bin/packer && \
     chmod a+x /usr/local/bin/packer

#set terraform perms
RUN unzip terraform.zip
RUN mv terraform /usr/local/bin/terraform && \
     chmod a+x /usr/local/bin/terraform

# cleanup
RUN rm packer.zip terraform.zip

WORKDIR /devops

CMD echo "You must call ansible, packer or terraform commands: eg `docker run wesleycharlesblake/devops-tools ansible --version`"

