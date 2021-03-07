# capev2-box

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/npoau28of5rv1eww/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/capev2-box/branch/master) |

Developer box for [CAPEv2](https://github.com/kevoreilly/CAPEv2).


## Getting Started

Clone the repository:
```
$ git clone --recursive https://github.com/extra2000/capev2-box
```


## Creating Vagrant box

Create NGINX pillar file based on the example. Optionally you can change the value in the `salt/roots/pillar/nginx.sls`:
```
$ cp -v salt/roots/pillar/zabbix-agent.sls.example salt/roots/pillar/zabbix-agent.sls
$ cp -v salt/roots/pillar/nginx.sls.example salt/roots/pillar/nginx.sls
$ cp -v salt/roots/pillar/filebeat.sls.example salt/roots/pillar/filebeat.sls
```

Create a vagrant file based on the example (you may need to increase memory from `v.memory = "5120"` to `v.memory = "12288"`) and then create the Vagrant box (you can change to `--provider=libvirt` if you are using Libvirt provider):
```
$ cp -v vagrant/examples/Vagrantfile.capev2-box.ubuntu-2004.x86_64.example vagrant/Vagrantfile.capev2-box
$ vagrant up --provider=virtualbox
```

Set timezone to your location, for example:
```
$ vagrant ssh capev2-box -- sudo timedatectl set-timezone Asia/Kuala_Lumpur
```


## CAPEv2 Installations

Install KVM virtualizations:
```
$ vagrant ssh capev2-box
$ sudo /opt/doomedraven-tools/Virtualization/kvm-qemu.sh all
$ exit
$ vagrant reload
```

Install CAPEv2:
```
$ vagrant ssh capev2-box
$ sudo cp -rv /opt/CAPEv2{-source,}
$ sudo bash /opt/doomedraven-tools/Sandbox/cape2.sh base
$ sudo chown -R cape:cape /opt/CAPEv2
$ sudo mkdir -pv /var/log/capev2
$ sudo systemctl set-default multi-user.target
```

Fix Volatility3 issue:
```
$ sudo chown -R cape:cape /usr/local/lib/python3.8/dist-packages/volatility3/symbols
```

Fix TRiD issue:
```
$ sudo chmod a+x /opt/CAPEv2/data/trid/trid
$ sudo rm -f /usr/lib/locale/locale-archive && sudo locale-gen --no-archive
```

Exit and reload Vagrant box:
```
$ exit
$ vagrant reload
```

Disable swap memory, install Zabbix agent, and then install NGINX with self-signed certificate:
```
$ vagrant ssh capev2-box -- sudo salt-call state.highstate
$ vagrant ssh capev2-box -- sudo salt-call state.sls https
```


## Creating Windows 7 VM as the Sandbox guest

Rename `Windows.iso` to your ISO name for the Windows 7 installation ISO file:
```
$ vagrant scp Windows.iso capev2-box:/home/vagrant/Windows.iso
$ vagrant ssh capev2-box
$ sudo virt-install --name cuckoo1 --memory 4096 --vcpus 2 --machine pc --os-variant win7 --network="default",model=e1000 --cdrom /home/vagrant/Windows.iso --disk path=/var/lib/libvirt/images/cuckoo1.qcow2,size=32,bus=sata,format=qcow2 --graphics vnc,listen=0.0.0.0,port=5900 --noautoconsole
```

On host, use `vncviewer` from [TigerVNC](https://tigervnc.org/) command to view Windows 7 installations (you may need to replace `capev2-box` with it's IP address):
```
$ vncviewer capev2-box:5900
```

After finished installations, `cuckoo1` VM will shutdown. Execute the following command to continue installations:
```
$ sudo virsh start cuckoo1
```

Then, shutdown `cuckoo1` and disconnect the installation ISO media (use `$ sudo virsh domblklist cuckoo1` to find out whether the installation ISO is `sda` or `hda`):
```
$ sudo virsh change-media cuckoo1 hda --eject --config
$ rm -v /home/vagrant/Windows.iso
```


## Static DHCP Network for Guests

Execute `$ sudo virsh dumpxml cuckoo1 | grep "mac address"` to find out `cuckoo1` MAC address. For this example, assume it's MAC address is `'52:54:00:7e:3a:8e'`.

Make sure to shutdown all guests. Execute `$ sudo virsh net-edit default` and add `<host mac='52:54:00:7e:3a:8e' ip='192.168.122.2'/>` line inside `<dhcp></dhcp>`. For example:
```
<network>
  <name>default</name>
  <uuid>427f0047-b99e-40c7-9d7e-d1df39d5e353</uuid>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:4d:75:81'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
      <host mac='52:54:00:7e:3a:8e' ip='192.168.122.2'/>
    </dhcp>
  </ip>
</network>
```

Apply changes to the network:
```
$ sudo virsh net-destroy default
$ sudo virsh net-start default
```


## Configure CAPEv2

Set the following values in `/opt/CAPEv2/conf/cuckoo.conf`:
```
[cuckoo]
reschedule = on
max_analysis_count = 1
max_machines_count = 1
max_vmstartup_count = 1
freespace = 10000

[resultserver]
ip = 192.168.122.1
```

Set the following values in `/opt/CAPEv2/conf/kvm.conf`:
```
[cuckoo1]
ip = 192.168.122.2
snapshot = clean
resultserver_ip = 192.168.122.1
tags = x64
```

Disable rate limiting `/opt/CAPEv2/conf/api.conf`:
```
[api]
ratelimit = no
```

Enable Malware scoring in `/opt/CAPEv2/conf/web.conf`:
```
[malscore]
enabled = yes
```

To disable VirusTotal, set the following value in `/opt/CAPEv2/conf/processing.conf`:
```
[virustotal]
enabled = no
```

In `/lib/systemd/system/cape-processor.service`, set `-p7` to `-p1` and `RestartSec=1m`. This will reduce the number of parallel processing from 7 CPUs to 1 CPU to reduce memory consumption. Since the `cape-processor.service` is just a script, not a daemon, the `RestartSec=1m` will ensure the `cape-processor.service` will be executed for every 1 minute. For example:
```
...
[Service]
...
ExecStart=/usr/bin/python3 process.py -p1 auto -pt 900
...
RestartSec=1m
```

Reload systemd to apply changes in `/lib/systemd/system/cape-processor.service`:
```
$ sudo systemctl daemon-reload
```

Finally, restart all `cape` services:
```
$ sudo systemctl stop cape-processor.service cape-rooter.service cape-web.service cape.service
$ sudo systemctl start cape-processor.service cape-rooter.service cape-web.service cape.service
```


## CAPEv2 Agent Installations

Start `cuckoo1` VM:
```
$ sudo virsh start cuckoo1
```

Then, setup the following prerequisites:
1. Install Firefox
1. Install Python 3.6.8 (32-bit). During installation, enable `Add Python 3.6 to PATH`.
1. Shutdown

Mount QCOW2 Image to Host. Execute the following command on host to load `nbd` module and connect the `qcow2` image to host:
```
$ sudo modprobe nbd max_part=8
$ sudo qemu-nbd --connect=/dev/nbd0 /var/lib/libvirt/images/cuckoo1.qcow2
$ sudo mount -v /dev/nbd0p2 /mnt
```

Copy CAPEv2 agent into `cuckoo1.qcow2`:
```
$ cp -v /opt/CAPEv2-source/agent/agent.py /mnt/agent.py
```

Unmount and disconnect `/dev/nbd0`:
```
$ sudo umount -v /mnt
$ sudo qemu-nbd --disconnect /dev/nbd0
```

Start `cuckoo1` VM:
```
$ sudo virsh start cuckoo1
```

Run `PowerShell` as `Administrator`:
```
> cd C:\
> python agent.py
```

Let the VM idle for a few minutes. Then while the VM is running, create snapshot:
```
$ sudo virsh snapshot-create-as cuckoo1 --name clean
```

Then, turn off `cuckoo1` VM:
```
$ sudo virsh destroy cuckoo1
```


## Hardening Sandbox Security

To change network from NAT to Host-only, Execute `$ sudo virsh net-edit default` and remove a line containing `<forward mode='nat'/>`. Then, apply changes:
```
$ sudo virsh net-destroy default
$ sudo virsh net-start default
```

However, the VM will not have Internet access.


## Notes

To monitor VM, you can use VNC.


## Maintenance

To cleanup old data:
```
$ cd /opt/CAPEv2/utils
$ sudo python3 cleaners.py --delete-older-than-days 7
$ sudo systemctl stop cape-processor.service cape-rooter.service cape-web.service cape.service
$ sudo systemctl start cape-processor.service cape-rooter.service cape-web.service cape.service
```


## Increase Vagrant Disk Size

This Section is applicable for Linux host and Libvirt provider. The following commands should be executed on the Vagrant host.

Make sure to shutdown the Vagrant box:
```
$ vagrant halt capev2-box
```

Expand the Vagrant box storage with extra 200G of the current size:
```
$ sudo qemu-img resize /path/to/capev2-box_capev2-box.img +200G
```

Load `nbd` module and bind the image to host:
```
$ sudo modprobe nbd max_part=8
$ sudo qemu-nbd --connect=/dev/nbd0 /path/to/capev2-box_capev2-box.img
```

Check which partition to resize via `parted` `print` command. In this case, it is `/dev/nbd0p3`. Note that if `parted` detects that the drive has extra space and `parted` able to fix it, do fix it:
```
$ sudo parted /dev/nbd0 print
$ sudo e2fsck -f /dev/nbd0p3
$ sudo parted /dev/nbd0 print
$ sudo parted /dev/nbd0 -- resizepart 3 -1
$ sudo resize2fs /dev/nbd0p3
$ sudo e2fsck -f /dev/nbd0p3
$ sudo parted /dev/nbd0 print
```

After finished resizing, disconnect the image:
```
$ sudo qemu-nbd --disconnect /dev/nbd0
```
