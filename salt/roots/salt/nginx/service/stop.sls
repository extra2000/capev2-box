# -*- coding: utf-8 -*-
# vim: ft=sls

nginx.service:
  service.dead:
    - enable: false
