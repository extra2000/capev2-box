# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import NGINX with context %}

/opt/nginx/ssl:
  file.directory:
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - makedirs: true

/opt/nginx/ssl/ssl.conf:
  file.managed:
    - source: salt://nginx/files/ssl.conf.jinja
    - user: {{ NGINX.hostuser.name }}
    - group: {{ NGINX.hostuser.group }}
    - template: jinja
    - context:
      ssl: {{ NGINX.ssl }}

/etc/pki/nginx:
  file.directory:
    - makedirs: true

/etc/pki/nginx/private:
  file.directory:
    - mode: 500

nginx-ssl-generate:
  cmd.run:
    - name: openssl req -x509 -newkey rsa:4096 -keyout private/server.key -out server.crt -days {{ NGINX.ssl.days_valid }} -nodes -config /opt/nginx/ssl/ssl.conf
    - cwd: /etc/pki/nginx
    - require:
      - file: /opt/nginx/ssl/ssl.conf

{% if NGINX.dhparam.enabled %}
nginx-dhparm-present:
  cmd.run:
    - name: openssl dhparam -out /etc/pki/nginx/private/dhparam.pem {{ NGINX.dhparam.bits }}
    - require:
      - file: /etc/pki/nginx/private
{% endif %}

/etc/nginx/ssl-params.conf:
  file.managed:
    - name: /etc/nginx/ssl-params.conf
    - source: salt://nginx/files/ssl-params.conf.jinja
    - template: jinja
    - context:
      dhparam: {{ NGINX.dhparam }}
