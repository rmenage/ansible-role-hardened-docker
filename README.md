<!-- DOCSIBLE START -->

# 📃 Role overview

![CI/CD](https://gitlab.com/rmenage/ansible-role-hardened-docker/badges/main/pipeline.svg)

| Field                | Value           |
|--------------------- |-----------------|
| Readme update        | 26/02/2026 |


## role-hardened-docker



Description: hardened setup for Docker on Linux, client TLS for TCP port access to the daemon








## How to install

```
ansible-galaxy role install rmenage.hardened_docker
```
## Playbook

```yml
---
- name: Example Usage
  hosts: all
  gather_facts: true # Disable if your role does not rely on facts
  tasks:
    - name: Update apt cache.
      apt: update_cache=yes cache_valid_time=600
      when: ansible_facts.os_family == 'Debian'
    - name: Install docker
      ansible.builtin.import_role:
        name: geerlingguy.docker
      vars:
        docker_service_manage: true
        docker_daemon_options:
          log-opts:
            max-size: "50m"
            max-file: "3"
    - name: Secure Docker with client TLS
      ansible.builtin.include_role:
        name: rmenage.hardened_docker
      vars:
        rhd_server_cert_path: /etc/docker
        rhd_client_cert_path: /vagrant/docker-client-certs
        rhd_host: "0.0.0.0"
        rhd_secured_tcp_listener: yes

```



### Defaults

**These are static variables with lower priority**

#### File: defaults/main.yml

| Var          | Type         | Value       |
|--------------|--------------|-------------|
| [rhd_restart_docker](defaults/main.yml#L3)   | bool | `True` |    
| [rhd_docker_restart_handler_state](defaults/main.yml#L4)   | str | `restarted` |    
| [rhd_secured_tcp_listener](defaults/main.yml#L7)   | bool | `False` |    
| [rhd_system_tmp](defaults/main.yml#L11)   | str | `/tmp` |    
| [rhd_country](defaults/main.yml#L12)   | str | `XX` |    
| [rhd_state](defaults/main.yml#L13)   | str | `Default State` |    
| [rhd_locality](defaults/main.yml#L14)   | str | `Default City` |    
| [rhd_organization](defaults/main.yml#L15)   | str | `Default Company` |    
| [rhd_host](defaults/main.yml#L16)   | str | `127.0.0.1` |    
| [rhd_common_name](defaults/main.yml#L17)   | str | `{{ rhd_host }}` |    
| [rhd_passphrase](defaults/main.yml#L18)   | str | `changeme` |    
| [rhd_server_cert_path](defaults/main.yml#L19)   | str | `/etc/docker` |    
| [rhd_client_cert_path](defaults/main.yml#L20)   | str | `~/.docker` |    
| [rhd_days](defaults/main.yml#L21)   | int | `365` |    
| [rhd_ca_days](defaults/main.yml#L22)   | str | `{{ rhd_days }}` |    
| [rhd_server_days](defaults/main.yml#L23)   | str | `{{ rhd_days }}` |    
| [rhd_client_days](defaults/main.yml#L24)   | str | `{{ rhd_days }}` |    
| [rhd_ca_cert_subj](defaults/main.yml#L25)   | str | `/C={{ rhd_country }}/ST={{ rhd_state }}/L={{ rhd_locality }}/O={{ rhd_organization }}/CN={{ rhd_common_name }}` |    

## Author Information
rmenage

#### License

MIT

#### Minimum Ansible Version

2.15.1

#### Platforms

- **Debian**: ['bookworm', 'trixie']
- **EL**: ['9', '10']

<!-- DOCSIBLE END -->
