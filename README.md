Ansible Lockdown
----------------


### Intro ###

Ansible Lockdown is a collection of Ansible roles related to security automation. All roles included in this project must meet the [contribution guidelines](CONTRIBUTING.md).

Some roles referenced in this project are a collaborative effort between [Ansible][ansible] and our IT Security partner [MindPoint Group][mpg] to provide you with thorough, vetted, and trusted security roles that you can integrate with any of your existing playbooks or as the building blocks for completely new playbooks. Other roles included in this project, while not vetted by MindPoint Group, have been deemed by the maintainers and community to meet the contribution guidelines.

The initial effort is for the development of roles centered around STIG and CIS benchmark baselines. Based on community feedback we'll then proceed with other security guidelines for additional operating systems and applications.

### Community ###
Most of the communication around the project happens on the [mailing list](https://groups.google.com/forum/#!forum/ansible-lockdown). That is best way to stay up to date with what is happening with the project.

For faster feedback, there is an `#ansible-lockdown` IRC channel on Freenode.


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
|   DISA STIG  |   RHEL 6 |   [GitHub][0]  |  [RHEL6-STIG][galaxy-rhel6]  |  TBD  |
|   DISA STIG  |   RHEL 7 |   [GitHub][1]  |  [RHEL7-STIG][galaxy-rhel7]  |  [![Build Status](https://travis-ci.org/MindPointGroup/RHEL7-STIG.svg?branch=devel)](https://travis-ci.org/MindPointGroup/RHEL7-STIG)  |
|   CIS        |   RHEL 7 |   [GitHub][5]  |  [RHEL7-CIS][galaxy-rhel7-cis]  |  [![Build Status](https://travis-ci.org/MindPointGroup/RHEL7-CIS.svg?branch=devel)](https://travis-ci.org/MindPointGroup/RHEL7-CIS)  |
|   DISA STIG  |   Windows Server 2012 DC |   [GitHub][2]  | TBD   | TBD  |
|   DISA STIG  |   Windows Server 2012 MS |   [GitHub][3]  | TBD   | TBD  |
|   DISA STIG  |   Windows Server 2008R2 MS |   [GitHub][4]  | TBD   | TBD  |



[0]:https://github.com/MindPointGroup/RHEL6-STIG
[1]:https://github.com/MindPointGroup/RHEL7-STIG
[2]:https://github.com/MindPointGroup/Windows-2012-Domain-Controller-STIG
[3]:https://github.com/MindPointGroup/Windows-2012-Member-Server-STIG
[4]:https://github.com/MindPointGroup/Windows-2008R2-Member-Server-STIG
[5]:https://github.com/MindPointGroup/RHEL7-CIS
[ansible]: http://www.ansible.com/
[mpg]:https://www.mindpointgroup.com/
[DISA]:http://iase.disa.mil/stigs/os/unix-linux/Pages/index.aspx
[CIS]:https://benchmarks.cisecurity.org
[stigma-repo]:https://github.com/defionscode/STIGMA
[openscap]:http://www.open-scap.org/page/Main_Page
[galaxy-rhel6]:https://galaxy.ansible.com/MindPointGroup/STIG-RHEL6
[galaxy-rhel7]:https://galaxy.ansible.com/MindPointGroup/RHEL7-STIG
[galaxy-rhel7-cis]:https://galaxy.ansible.com/MindPointGroup/RHEL7-CIS
[ansible-docs]:http://docs.ansible.com/
[galaxy-url]:https://galaxy.ansible.com/intro

