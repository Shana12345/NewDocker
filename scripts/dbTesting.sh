- name: Install docker dependencies

  apt: 

    name: "{{ item }}"

    state: latest

    update_cache: yes

  with_items:

    - apt-transport-https

    - ca-certificates

    - curl

    - software-properties-common

  tags: docker



- name: Get docker key

  apt_key:

    url: https://download.docker.com/linux/ubuntu/gpg

    state: present

  tags: docker



- name: Add docker packages to repository

  apt_repository:

    repo: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ ansible_lsb.codename|lower }} stable

  tags: docker



- name: Install docker-ce

  apt: 

    name: docker-ce

    state: latest

    update_cache: yes

  tags: docker