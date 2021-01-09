# -*- coding: utf-8 -*-
# vim: ft=sls

swapoff-current-session:
  cmd.run:
    - name: swapoff --all

swapoff-persistently:
  file.line:
    - name: /etc/fstab
    - match: '(UUID=).*(swap).*'
    - mode: delete  
