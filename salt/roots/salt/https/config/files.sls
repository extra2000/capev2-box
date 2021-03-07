# -*- coding: utf-8 -*-
# vim: ft=sls

/etc/nginx/conf.d/https.conf:
  file.managed:
    - source: salt://https/files/https.conf.jinja
    - template: jinja

capev2-nginx-service-stop:
  service.dead:
    - name: nginx.service

capev2-nginx-service-running:
  service.running:
    - name: nginx.service
