Ansible Lockdown
================

If you're reading this, hopefully you are considering helping out with the Lockdown project.

Herein lies the contribution guidelines for helping out with this project. Do take the guidelines here literally, if you find issue with any of them or you see room for improvement, please let us know via a GitHub issue or via the [Lockdown mailing list][mail].

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
    * Category level (`cat1`, `cat2`, `cat3`)
    * Severity level (`high`, `medium`, `low`)
    * `audit` or `patch` to match the task name
    * Vulnerability ID number (example, the vulnerability ID number in the case of RHEL6 STIG)
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
- name: |

        MEDIUM | V-38443 | PATCH | The /etc/gshadow file must be owned by root.
        MEDIUM | V-38448 | PATCH | The /etc/gshadow file must be group-owned by root.
        MEDIUM | V-38449 | PATCH | The /etc/gshadow file must have mode 0000.
```

* All fact gathering tasks should:
    * have `changed_when: no`
    * have `always_run: yes`
    * should  include `ignore_errors` when necessary.
    * register verbose variable names that end with `_audit`

### Running arbitrary commands ###

When using `command`, `shell`, `raw`, or `script`, an appropriate `changed_when` and/or `failed_when` must be set on the task rather than `ignore_errors`. Do not simply ignore errors on a task unless absolutely necessary. Take the time to properly evaluate and define change and failure conditions.

[coc]:http://docs.ansible.com/ansible/community.html#community-code-of-conduct
[mail]:https://groups.google.com/forum/#!forum/ansible-lockdown


