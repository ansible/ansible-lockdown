Ansible Lockdown
================

If you're reading this, hopefully you are considering helping out with the Lockdown project.

Herein lies the contribution guidelines for helping out with this project. Do take the guidelines here literally. If you find issue with any of them or you see room for improvement, please let us know via a GitHub issue or via the [Lockdown mailing list][mail].

## Rules ##

* Should you find any security exploit, please contact security@ansible.com immediately.
* The Ansible [Code of Conduct][coc] still applies.
* Should you wish to work on a completely new standard, GREAT, but please contact the mailing list first as we would want to make a repo for you to work from.
* To contribute, fork and make a pull request against the devel branch.

## Style Guide ##

All tasks should be in YAML literal.

```yml
# This
- name: Create a directory
  file:
      state: directory
      path: /tmp/deletethis

# Not this
- name: Create a directory
  file: state=directory path=/tmpt/deletethis
```

There should be no space before a task hyphen.

```yml
# This
- name: Do something

# Not this
   - name: Do something
```

Module arguments should be indented four spaces.

```yml
# This
- name: Create a directory
  file:
      state: directory
      path: /tmp/deletethis

# Not This
- name: Create a directory
  file:
    state: directory
    path: /tmp/deletethis
```

* There should be a single line break between tasks
* Every task (except `prelim` tasks) should have, at a minimum and when applicable, the following tags in the following order:
    * Category level (`cat1`, `cat2`, `cat3`), applied in top level `main.yml` include except for prelim.yml
    * Severity level (`high`, `medium`, `low`), applied in top level `main.yml` include except for prelim.yml
    * Vulnerability ID number, STIG ID, or CIS rule number. Examples:
      * Vulnerability ID number in the case of RHEL6 STIG
      * STIG ID in case of RHEL7 STIG
      * Section, chapter, etc style rule number (ex. rule_1.1.1.1) in case of RHEL7 CIS
    * Descriptive tags to help with granual execution of tasks
* Tags should be in multi-line format and indented four spaces just like module arguments above

```yml
# This
- name: "HIGH | V-38491 | AUDIT | There must be no hosts.equiv on the system"
  stat:
      path: /etc/hosts.equiv
  register: hosts_equiv_audit
  always_run: yes
  tags:
      - cat1
      - high
      - audit
      - V-38491
      - hosts_equiv

# Not This
- name: "HIGH | V-38491 | AUDIT | There must be no hosts.equiv on the system"
  stat:
    path: /etc/hosts.equiv
  register: hosts_equiv_audit
  always_run: yes
  tags:
    - cat1
    - high
    - audit
    - V-38491
    - hosts_equiv
```

* Tasks should run sequentially by vulnerability ID as listed in the given standard.
* Every task must be named and should adhere to the following convention:

```yml
- name: "$severity | $id_number | (PATCH|AUDIT) | $description_provided_by_standard"

- name: "HIGH | V-38476 | PATCH | Vendor-provided cryptographic certificates must be installed to verify the integrity of system software."
```

* If a task requires a previous check of some sort, e.g., listing running services on the system, it should be grouped with other check tasks in a single task file rather than spread throughout the role tasks. They should also be tagged with `always` to ensure they are run every time.
* There should only be one standard remediated or checked per task, even if several remediations could be combined into a single task. The goal is granular remediation at the expense of efficiency.
* If multiple standards _must_ be combined into a single task, the name should adhere to the following convention:

```yml
- name: "MEDIUM | V-38443 | PATCH | The /etc/gshadow file must be owned by root.\n
         MEDIUM | V-38448 | PATCH | The /etc/gshadow file must be group-owned by root.\n
         MEDIUM | V-38449 | PATCH | The /etc/gshadow file must have mode 0000.\n"
```

* All fact gathering tasks should:
    * have `changed_when: no` unless a needed change has been detected
    * have `check_mode: no`
    * should  include `failed_when` to ignore errors when appropriate.
    * register verbose variable names that end with `_audit`

### Running arbitrary commands ###

When using `command`, `shell`, `raw`, or `script`, an appropriate `changed_when` and/or `failed_when` must be set on the task rather than `ignore_errors`. Do not simply ignore errors on a task unless absolutely necessary. Take the time to properly evaluate and define change and failure conditions.

### Configuration Validation ###

It is quite common to modify critical system configuration files during the course of security hardening. These include things such as `sudoers`, PAM settings, and `sshd_config`. All these files have the potential to lock you out of the system completely if a syntax error is introduced into the file. When modifying the configuration of critical components such as those listed above, all tasks should use the `validate` parameter to ensure the file is syntactically correct before being put in to place. This will save you from the need to [bake a cake](http://jpmens.net/2013/02/12/sudo-bake-me-a-cake/).

[coc]:https://docs.ansible.com/ansible/latest/community/code_of_conduct.html
[mail]:https://groups.google.com/forum/#!forum/ansible-lockdown
