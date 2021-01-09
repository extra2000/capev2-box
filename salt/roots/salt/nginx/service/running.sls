# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import NGINX with context %}

/etc/nginx/sites-available/https.conf:
  file.managed:
    - source: salt://nginx/files/https.conf.jinja
    - template: jinja
    - context:
      client_max_body_size: {{ NGINX.client_max_body_size }}
      capev2: {{ NGINX.capev2 }}

{% if not salt['file.directory_exists' ]('/etc/nginx/sites-available/https.conf') %}
symlink:
  file.symlink:
    - name: /etc/nginx/sites-enabled/https.conf
    - target: /etc/nginx/sites-available/https.conf
{% endif %}

# If NGINX is already installed, it have to be stop and then start again to apply configs
nginx-service-stop:
  service.dead:
    - name: nginx.service

nginx-service-running:
  service.running:
    - name: nginx.service
    - enable: true
