Ansible-Lockdown
----------------


### Intro

Ansible-Lockdown is a collaborative effort between Ansible and our IT Security partner MindPoint Group to provide you with thorough, vetted, and trusted security roles that you can integrate with any of your existing playbooks or as the building blocks for completely new playbooks. 

The initial effort is for the development of roles centered around STIG and CIS benchmark baselines. Based on community feedback we'll then proceed with other security guidelines for additional operating systems and applications.

This repository in particular is intended to serve as a centralized repository utilizing submodules that point to all security-role repositories that are jointly maintained Ansible and MindPoint Group. 


### Instructions

In order to use the roles you should first ensure that you have [Ansible][ansible-docs] installed. You can then download the roles in their entirety through git by following the appropriate links in the table or you can leverage [ansible-galaxy][galaxy-url].


### STIGS

The standards are pulled directly from [DISA]. 


### CIS 

The standards are pulled directly from [CIS].


### Contributing

Contributions to ansible-lockdown and STIG roles will follow a similar process to the main Ansible project. Fork the repository, make changes, and submit a pull-request. Pull-request should not contain any merges or merge-conflicts.

Feature request, bug reports, etc, should all be opened as GitHub tickets. An ansible-lockdown mailing list is in the works.


Current Build Statuses For Security Roles
----------------------------------------------------------------------------------------------------


|    Standard  |      OS      |     Repo     |       Galaxy Link        |          Status          | 
| -------------|--------------|--------------|--------------------------|--------------------------|
|   DISA STIG  |   RedHat 6.* |   [Repo][0]  |  [Galaxy][galaxy-rhel6]  |  ![STATUS][rhel6status]  |

**Note:** A green badge represents a successful build which consists of:
  1. Creating an AWS EC2 instance from the AMI's provided by AWS as defaults.
  2. Applying the STIG baselines.
  3. Using [OpenSCAP][openscap] and [STIGMA][stigma-repo] to further validate the application of the baselines.




[0]:https://github.com/ansible/RHEL6-STIG
[rhel6status]:https://codeship.com/projects/6ff25160-95b3-0132-d4fc-466960a0e7d2/status?branch=devel
[DISA]:http://iase.disa.mil/stigs/Pages/index.aspx
[CIS]:https://benchmarks.cisecurity.org
[stigma-repo]:https://github.com/defionscode/STIGMA
[openscap]:http://www.open-scap.org/page/Main_Page
[galaxy-rhel6]:https://galaxy.ansible.com/list#/roles/2953
[ansible-docs]:http://docs.ansible.com/
[galaxy-url]:https://galaxy.ansible.com/intro
