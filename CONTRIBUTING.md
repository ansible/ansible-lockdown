Ansible Lockdown
================

If you're reading this, hopefully you are considering helping out with the Lockdown project. 

Herein lies the contribution guidelines for helping out with this project. Do take the guidlines here literally, if you find issue with any of them or you see room for improvement, please let us know via a GitHub issue or via the [Lockdown mailing list][mail].



## Rules

* Should you find any security exploit, please contact security@ansible.com immediately. 
* The Ansible [Code of Conduct][coc] still applies

* Should you wish to work on a completely new standard, GREAT, but please contact the mailing list first as we would want to make a repo for you to work from. 

* To contribute, fork and make a pull request against the devel branch
* All tasks should be in YAML literal.

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

* There should be no space before a task hyphen

```yml
# This
- name: Do something

# Not this
   - name: Do something
```

* Module arguments should be indented 4 spaces
```yml
# This
- name: Create a directory
  file:
      state: directory
      path: /tmp/deletethis

# Not This
# This
- name: Create a directory
  file:
    state: directory
    path: /tmp/deletethis
```

* There should be a single line break between tasks
* Every task (except prelim tasks) should have, at a minimum and when applicable, the following tags:
   * Severity level (cat1, cat2, high, etc)
   * Identification number (example, the vulnerabilty ID number in the case of RHEL6 STIG)
   * audit/patch
* Tags can be either bracketed or multi-line
* Tasks should happen sequentially as they appear in the given standard. 
* Every task must be named and should adhere to the following convention:
```yml
- name: "| $severity | $id_number | patch/audit |\n
        $description_provided_by_standard"

- name: "| HIGH | V-38476 | PATCH |\n
        Vendor-provided cryptographic certificates must be installed to verify the integrity of system software."
```
* Every standard implemented must consist of at least two sequential tasks, one that conducts a check and registers it to a variable, and another that applies the standard. Note that the task which applies the standard does not necessarily have to use the registered variable from the prior task.
* There should only be one standard remediated or checked per task (even at the expense of having less code)
* All audit tasks should: 
    * have `changed_when: no`
    * have `always_run: yes`
    * should ignore errors when necessary.
    * register verbose variable names that end with `_audit`




[coc]:http://docs.ansible.com/ansible/community.html#community-code-of-conduct
[mail]:https://groups.google.com/forum/#!forum/ansible-lockdown


