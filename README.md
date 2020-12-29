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

Create a vagrant file based on the example and then create the Vagrant box (you can change to `--provider=libvirt` if you are using Libvirt provider):
```
$ cp -v vagrant/examples/Vagrantfile.capev2-box.ubuntu-2004.x86_64.example vagrant/Vagrantfile.capev2-box
$ vagrant up --provider=virtualbox
```


## CAPEv2 Installations

```
$ vagrant ssh capev2-box
$ sudo /opt/doomedraven-tools/Virtualization/kvm-qemu.sh all
$ exit
$ vagrant reload
```

```
$ vagrant ssh capev2-box
$ sudo cp -rv /opt/CAPEv2{-source,}
$ sudo bash /opt/doomedraven-tools/Sandbox/cape2.sh base cape
$ exit
$ vagrant reload
```


## Creating Windows 7 VM as the Sandbox guest

Rename `Windows.iso` to your ISO name for the Windows 7 installation ISO file:
```
$ vagrant scp Windows.iso capev2-box:/home/vagrant/Windows.iso
$ vagrant ssh capev2-box
$ sudo virt-install --name cuckoo1 --memory 2048 --vcpus 1 --machine pc --os-variant win7 --network="default",model=e1000 --cdrom /home/vagrant/Windows.iso --disk path=/var/lib/libvirt/images/cuckoo1.qcow2,size=32,bus=sata,format=qcow2 --graphics vnc,listen=0.0.0.0,port=5900 --noautoconsole
```

On host, use `vncviewer` from [TigerVNC](https://tigervnc.org/) command to view Windows 7 installations (you may need to replace `capev2-box` with it's IP address):
```
$ vncviewer capev2-box:5900
```

After finished installations, `cuckoo1` VM will shutdown. Execute the following command to continue installations:
```
$ sudo virsh start cuckoo1
```


## Static DHCP Network for Guests

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

Use `$ sudo virsh edit cuckoo1` to find out `cuckoo1` MAC address. Can be found under `<interface type='network'>...</interface>`.

Apply changes to the network:
```
$ sudo virsh net-destroy default
$ sudo virsh net-start default
```


## Configure CAPEv2

Set the following values in `/opt/CAPEv2/conf/cuckoo.conf`:
```
[resultserver]
ip = 192.168.122.1
```

Set the following values in `/opt/CAPEv2/conf/kvm.conf`:
```
[cuckoo1]
ip = 192.168.122.2
snapshot = clean
resultserver_ip = 192.168.122.1
```

To disable VirusTotal, set the following value in `/opt/CAPEv2/conf/processing.conf`:
```
[virustotal]
enabled = no
```

Finally, restart `cape` service:
```
$ sudo systemctl restart cape.service
```


## CAPEv2 Agent Installations

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

To change network from NAT to Host-only, remove `<forward mode='nat'/>` in `$ sudo virsh net-edit default`. Then, apply changes:
```
$ sudo virsh net-destroy default
$ sudo virsh net-start default
```

However, the VM will not have Internet access.


## Notes

To monitor VM, you can use VNC.
