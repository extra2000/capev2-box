# -*- coding: utf-8 -*-
# vim: ft=sls

allow-others-read-nginx-log:
  cmd.run:
    - name: chmod -R o+r /var/log/nginx/
    - force: true
