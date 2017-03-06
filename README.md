Ansible Lockdown
----------------


### Intro ###

Ansible Lockdown is a collection of Ansible roles related to security automation. All roles included in this project must meet the [contribution guidelines](CONTRIBUTING.md).

Some roles referenced in this project are a collaborative effort between [Ansible][ansible] and our IT Security partner [MindPoint Group][mpg] to provide you with thorough, vetted, and trusted security roles that you can integrate with any of your existing playbooks or as the building blocks for completely new playbooks. Other roles included in this project, while not vetted by MindPoint Group, have been deemed by the maintainers and community to meet the contribution guidelines.

The initial effort is for the development of roles centered around STIG and CIS benchmark baselines. Based on community feedback we'll then proceed with other security guidelines for additional operating systems and applications.

### Mailing List ###
Most of the communication around the project happens on the [mailing list](https://groups.google.com/forum/#!forum/ansible-lockdown). That is best way to stay up to date with what is happening with the project.



### Instructions ###

In order to use the roles you should first ensure that you have [Ansible][ansible-docs] installed.

To clone the entire project and use the included playbooks:

    git clone --recursive https://github.com/ansible/ansible-lockdown.git

You can also install the roles individually from Ansible Galaxy.


### STIGS ###

The standards are pulled directly from [DISA].


### CIS ###

The standards are pulled directly from [CIS].


### Contributing ###

Contributions to Ansible Lockdown and roles referenced here will follow a similar process to the main Ansible project. Fork the repository, make changes, and submit a pull request. Pull requests should not contain any merges or merge conflicts.

Feature requests and bug reports should all be opened on the project page for the individual role, not here.


Current Build Statuses for Security Roles
----------------------------------------------------------------------------------------------------


|    Standard  |      OS      |     Repo     |       Galaxy Link        |          Status          |
| -------------|--------------|--------------|--------------------------|--------------------------|
|   DISA STIG  |   RedHat 6.* |   [Repo][0]  |  [Galaxy][galaxy-rhel6]  |  [ ![Codeship Status for MindPointGroup/RHEL6-STIG](https://app.codeship.com/projects/6ff25160-95b3-0132-d4fc-466960a0e7d2/status?branch=devel)](https://app.codeship.com/projects/62882)  |
|   DISA STIG  |   RedHat 7.* |   [Repo][1]  |         TBD              |         TBD              |

**Note:** A green badge represents a successful build which consists of:
  1. Creating an AWS EC2 instance from the AMI's provided by AWS as defaults.
  2. Applying the security baseline.
  3. Using [OpenSCAP][openscap] and [STIGMA][stigma-repo] to further validate the application of the baselines.



[0]:https://github.com/MindPointGroup/RHEL6-STIG
[1]:https://github.com/MindPointGroup/RHEL7-STIG
[ansible]: http://www.ansible.com/
[mpg]:https://www.mindpointgroup.com/
[DISA]:http://iase.disa.mil/stigs/os/unix-linux/Pages/index.aspx
[CIS]:https://benchmarks.cisecurity.org
[stigma-repo]:https://github.com/defionscode/STIGMA
[openscap]:http://www.open-scap.org/page/Main_Page
[galaxy-rhel6]:https://galaxy.ansible.com/nousdefions/STIG-RHEL6/
[ansible-docs]:http://docs.ansible.com/
[galaxy-url]:https://galaxy.ansible.com/intro

