RHEL 6 DISA STIG
================

Configure RHEL 6 machine to be DISA STIG compliant. CAT I findings will be corrected by default. CAT II and CAT III findings can be corrected by setting the appropriate variable to enable those playbooks.

This role **will make changes to the system** that could break things. This is not an auditing tool but rather a remediation tool to be used after an audit has been conducted.

The role tries to be helpful and pause to let you know it found something. You can disable this behaviour if you want to run it unattended by setting `rhel6stig_fullauto` to `true`.

Based on [Red Hat Enterprise Linux 6 Security Technical Implementation Guide 2013-06-03](http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/).

Inspiration and some config files taken from [RedHatGov](https://github.com/RedHatGov) [stig-fix-el6](https://github.com/RedHatGov/stig-fix-el6).

Requirements
------------

You should carefully read through the tasks to make sure these changes will not break your systems before running this playbook.

Role Variables
--------------

**rhel6stig_cat1**:           Correct CAT I findings (Default: true)

**rhel6stig_cat2**:           Correct CAT II findings (Default: false)

**rhel6stig_cat3**:           Correct CAT III findings (Default: false)

**rhel6stig_snmp_community**  borealis

**rhel6stig_fullauto**                   Run the role without pausing (Default: false)

**rhel6stig_root_email_address**          Address where system email is sent (Default: foo@baz.com)

**rhel6stig_xwindows_required**           Whether or not X Windows is is use on taregt systems. Disables some changes if X Windows is not in use. (Default: false)

**rhel6stig_pass_min_length**             Minimum password length (Default: 14)

**rhel6stig_pass_min_days**               Minimum password age in days (Default: 1)

**rhel6stig_pass_max_days**               Maximum password age in days (Default: 60)

**rhel6stig_system_auth_ac_pam_unix_parameters** Settings placed in /etc/pam.d/system-auth-ac that control password behaviour (Default: sha512 shadow nullok try_first_pass use_authtok remember=24)

**rhel6stig_system_auth_ac_pam_cracklib_parameters** Settings placed in /etc/pam.d/system-auth-ac that control password makeup (Default: try_first_pass retry=3 type= dcredit=-1 lcredit=-1 difok=4)


**rhel6stig_ipv6_in_use**       Whether or not ipv6 is in use of the target system. This is set automatically to 'true' if ipv6 is found to be in use. (Default: false)

**rhel6stig_tftp_required**  Whether or not TFTP is required. This will prevent the removal of `tftp` and `tftp-server` packages. It will also  reconfigure the `tftp-server` to run securely. (Default: false)
Dependencies

**rhel6stig_system_is_router** Whether on not the target system is acting as a router. Disables settings that would break the system if it is a acting as a router. (Default: false)

**rhel6stig_change_grub_password** Whether or not to update the grub password even if a hash already exists in `/boot/grub/grub.conf`. (Default: false)

**rhel6stig_ntp_config_servers** List of servers used in ntp.conf (Default: list of NTP pool servers)

**rhel6stig_ntp_config_restrict** List of restrict options used in ntp.conf

**rhel6stig_cat3_services** List of services that are stopped and disabled to correct CAT III findings. This should be customized to suit your environment.

**rhel6stig_temporary_users** List of user accounts and the expiration date to set. This variable is used by CAT III finding V-38685. (Default: undefined)

**rhel6stig_maxlogins** Number of maximum simultanous system logins. (Default: 10)

Dependencies
------------

Ansible > 1.6

Example Playbook
-------------------------

Make sure to include the vars_prompt section in your playbook. It is needed for the tasks that set the grub password.

    - hosts: servers
      sudo: yes

      roles:
         - { role: disa-stig-rhel6, rhel6stig_cat1: true, rhel6stig_cat2: true, rhel6stig_cat3: false }

    vars_prompt:
        - name: rhel6stig_bootloader_password
          prompt: "Enter grub password"
          default: Gr!_!B-Kn0c|/\
          private: yes
          encrypt: "sha512_crypt"
          confirm: yes
          salt_size: 8

Tags
----
Many tags are available for precise control of what is and is not changed. When running this playbook with tags, always include the `prelim_tasks` tag. This will run all the setup tasks that gather information and set variables used by subsequest tasks. If run without `prelim_tasks`, certain tasks will fail.

Here is the list of all available tags, not including finding IDs:

    accounts
    aide
    antivirus
    audit_permissions
    auditd
    bluetooth
    cat1
    cat2
    cat3
    config
    cron
    ctrl_alt_delete
    dccp
    dhcp
    dod_logon_banner
    file_integrity
    file_perms
    firewall
    gpgcheck
    grub
    grub_password
    gui
    hosts_equiv
    icmp_redirects
    interactive_boot
    intrusion_detection
    iptables
    ipv6
    kernel_modules
    kernel_parameters
    kerner_parameters
    ldap
    logging
    logon_settings
    mail
    mandatory_services
    mobile_devices
    netrc
    network
    nfs
    ntp
    packages
    passwords
    postfix
    prelim_tasks
    reverse_path_filter
    rexec
    rhosts
    rlogin
    root_access
    rpm
    rsh
    screen_lock
    sctp
    sendmail
    services
    snmp
    source_routed_packets
    ssh
    tcp_syncookies
    tcp_timestamps
    telnet
    test
    tftp
    tftp-server
    tipc
    unauthorized_packages
    unsecure_services
    updates
    usb_devices
    vsftp
    xinetd
    xwindows
    ypbind
    ypserv
    yum

Some examples of using tags:

    # Only remediate ssh
    ansible-playbook site.yml --tags="prelim_tasks,ssh"

    # Don't change SNMP or postfix
    ansible-playbook site.yml --skip-tags="postfix,mail,snmp"


License
-------

MIT

