ansible-lockdown
----------------

[TOC]

## Intro

This is intended to serve a centralized repo utilizing submodules that point to STIG and CIS repositories. Each individual STIG and CIS repo is intended to be available via Ansible Galaxy.


### STIGS

The standards are pulled directly from [DISA]. 


### CIS 

The standards are pulled directly from [CIS].


### Testing

Each repository, and subsequent commits,  will undergo an individual automated testing process which consists of:

1. Executing the STIG or CIS playbook
2. Validating the proper implementaiton of standards, benchmarks and or guidelines by utilizing guidance provided by either DISA or CIS. 

Test results are available below and at each repository's README.

### Contributing

Contributions to ansible-lockdown will follow a similar process to the main Ansible project. Fork the repository, make changes, and submit a pull-request. Pull-request should not contain any merges or merge-conflicts.

Feature request, bug reports, etc, should all be opened as GitHub tickets. An ansible-lockdown mailing list is in the works.


Current Build Statuses For STIGS
--------------------------------

    OS   |     Repo     |     Status
--------------------------------------
RedHat 6 |   Repo [0]   |    BUILD/FAIL icon



[DISA]:http://iase.disa.mil/stigs/Pages/index.aspx
[CIS]:https://benchmarks.cisecurity.org
