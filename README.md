# Comprehensive Network Automation Testing with Molecule and Cisco Modeling Labs

![title-slide](_images/preso-title-slide.png)

## Overview

This repository serves as an example, and overview of the workflow presented at Ansiblefest 2021, which leverages Ansible, Molecule, and Cisco Modeling Labs combined with Github Actions to provide a modern development lifecycle and testing solution for network automation.

> Note that the code in this repository can be used as a reference but will need modifications to work within your environment.

![development-workflow](_images/preso-development-workflow.png)

## Solution Components

The solution presented during Ansiblefest contains the following components, and below you will find links to the documentation for each:

* [Ansible](https://docs.ansible.com/)
* [Ansible Molecule](https://molecule.readthedocs.io/en/latest/index.html)
* [Cisco Modeling Labs](https://developer.cisco.com/modeling-labs/)
* [Github Actions](https://docs.github.com/en/actions)

## Solution Requirements

* GitHub actions-runner that has access to your lab environment.
* API access to your Infoblox appliances.
* Permissions to build a new topology on your target CML instance.

## Component Information

### Ansible Molecule

Ansible Molecule is a framework that allows you to set up, test, and teardown environments that support automated testing. Ansible Molecule is a crucial component for testing both Ansible roles and playbooks.

The workflow in the presentation goes through the following steps:

1. Reserving and allocating IP addresses from Infoblox IPAM.
2. Deploying a lab topology in Cisco Modeling Labs.
3. Applying device configurations to the lab topology.
4. Verifying the resulting configurations match our expectations.
5. Tearing down the lab topology to release resources.
6. Returning IP addressing to Infoblox IPAM.

![molecule-workflow](_images/preso-molecule-workflow.png)

You can run this workflow directly from your development environment or run it automatically by including it in the CI pipeline configured on GitHub.

### GitHub Actions

GitHub Actions provide the Continuous Integration element of Molecule test automation based on GitHub repository event triggers.

Below you will find some of the critical elements of the GitHub Actions workflow.  This file can also be found in `./.github/workflows/main.yml`.

![github-actions](_images/preso-github-actions.png)

The GitHub Action in this repository uses a self-hosted actions-runner, which you will need to deploy within your lab environment.  Deploying this runner within your lab environment will allow you to manipulate equipment in the lab through CI automation directly.

> For more information about the actions-runner, you can view the [Github Actions Self-Hosted Runner](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners) documentation.

### Encrypted Secrets and Environment Variables

GitHub repositories allow you to store sensitive data like API keys and passwords by leveraging the Encrypted Secrets feature. Additionally, you can reference the values stored in Encrypted Secrets in your GitHub Actions through the use of environment variables.

> For more information about encrypted secrets, you can view the [Github Actions Encrypted Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) documentation.

This lab requires the use of Environment Variables.  Some of these variables, such as device usernames and passwords, should be stored as Encrypted Secrets in GitHub to prevent unauthorized access to the credentials.  The required variables are:

```environment
export CML_HOSTNAME=[cml_hostname]
export CML_USERNAME=[cml_username]
export CML_PASSWORD=[cml_password]
export CML_SSL_VERIFY=False
export INFOBLOX_HOST=[infoblox_hostname]
export INFOBLOX_USERNAME=[infoblox_username]
export INFOBLOX_PASSWORD=[infoblox_password]
export INFOBLOX_SSL_VERIFY=False
# Ansible Settings
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_SSH_PIPELINING=True
```

## Thank You

![thank-you](_images/preso-thank-you.png)

## Contributors

* Nick Thompson
  * GitHub - <https://github.com/nsthompson/>
  * WWT Profile - <https://www.wwt.com/profile/nick-thompson/>
* Jeff Andiorio
  * GitHub - <https://github.com/jandiorio/>
  * WWT Profile - <https://www.wwt.com/profile/jeff-andiorio/>
