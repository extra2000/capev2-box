# Changelog

## [2.0.0](https://github.com/extra2000/capev2-box/compare/v1.3.0...v2.0.0) (2021-03-09)


### ⚠ BREAKING CHANGES

* **submodule:** Pillar format for `pillar/zabbix-agent.sls.example` has changed.

### Features

* **submodule:** Update `capev2/doomedraven-tools` ([6af702a](https://github.com/extra2000/capev2-box/commit/6af702a48851b1435d84e16ebb645b70f13fb5f1))
* **submodule:** Update `filebeat-formula` to [v1.1.1](https://github.com/extra2000/filebeat-formula/releases/tag/v1.1.1) ([09d7c19](https://github.com/extra2000/capev2-box/commit/09d7c192a2e4881c76fc17f6a703e199feaf5661))
* **submodule:** Update `zabbix-agent-formula` to [v2.0.1](https://github.com/extra2000/zabbix-agent-formula/releases/tag/v2.0.1) ([b30c92d](https://github.com/extra2000/capev2-box/commit/b30c92dd8e324a5af5199641f973f462fc1535d0))


### Fixes

* **salt:** Remove Filebeat from `salt/top.sls` ([c312676](https://github.com/extra2000/capev2-box/commit/c3126767dad191a0e771105ba4ffebd4d9c52ddf))


### Documentations

* **README:** Add `USER=cape;` before executing `cape2.sh` ([3e1e4a1](https://github.com/extra2000/capev2-box/commit/3e1e4a1fa229b8bef0ace5cc2c53c574feffb462))
* **README:** Add instruction to deploy Filebeat ([33f7ed8](https://github.com/extra2000/capev2-box/commit/33f7ed8118f8454f66bb73952da16f6942f9382b))
* **README:** Add instruction to view CAPEv2 web page after finished setup ([36dbba2](https://github.com/extra2000/capev2-box/commit/36dbba2c0999da8e1ed258af6b376b5e412cf6b1))
* **README:** After finished Firefox installation, set Firefox as default browser ([1959688](https://github.com/extra2000/capev2-box/commit/1959688d948d375d12f3777a63ac4cc96d9e544c))
* **README:** CAPEv2 services need to be stopped during agent installations ([4c33482](https://github.com/extra2000/capev2-box/commit/4c33482e04a5db0cdda48f671aa4a9166e2d84a8))
* **README:** Fix `memory_dump = on` mistake in `/opt/CAPEv2/conf/kvm.conf` and `/opt/CAPEv2/conf/cuckoo.conf` ([3098a8b](https://github.com/extra2000/capev2-box/commit/3098a8bc75ff2ec2a0940da155b7f046ddd26eb3))

## [1.3.0](https://github.com/extra2000/capev2-box/compare/v1.2.2...v1.3.0) (2021-03-07)


### Features

* **https:** Add `https` state to configure NGINX for CAPEv2 HTTPS ([64892d3](https://github.com/extra2000/capev2-box/commit/64892d3b34b3644e149dae44375b372853c32f77))
* **nginx:** Add state `nginx_log_permission` to allow `filebeat` container to read logs ([2bea3c0](https://github.com/extra2000/capev2-box/commit/2bea3c0960ba2d353dfdc500f3645e16ed0bc163))
* **submodule:** Add [filebeat-formula v1.1.0](https://github.com/extra2000/filebeat-formula/releases/tag/v1.1.0) ([4eceaf5](https://github.com/extra2000/capev2-box/commit/4eceaf50e99b33f242fca10ee505cdf766397a99))
* **submodule:** Add [nginx-formula v1.0.1](https://github.com/extra2000/nginx-formula/releases/tag/v1.0.1) ([80af7a7](https://github.com/extra2000/capev2-box/commit/80af7a718fcc8d42f5db8e7cefbfe57778e7c42d))
* **submodule:** Add [podman-formula v2.2.1](https://github.com/extra2000/podman-formula/releases/tag/v2.2.1) ([f117f9b](https://github.com/extra2000/capev2-box/commit/f117f9bf5b9e49ecd34a1acaa0d6264164d186e7))
* **submodule:** Add [zabbix-agent-formula v1.0.0](https://github.com/extra2000/zabbix-agent-formula/releases/tag/v1.0.0) ([b62ad2a](https://github.com/extra2000/capev2-box/commit/b62ad2a98efe7b99e50d892a3fac19239d5d329d))
* **submodule:** Update `capev2/CAPEv2` ([37ad0d3](https://github.com/extra2000/capev2-box/commit/37ad0d35fcd92de691a434d8c15af773ef3efac4))
* **submodule:** Update `capev2/doomedraven-tools` ([358e401](https://github.com/extra2000/capev2-box/commit/358e40191693815d65c2e5308db9fe6ad0d72e7b))


### Code Refactoring

* **nginx:** Remove existing `nginx` state in favor of `nginx-formula` ([7fbd748](https://github.com/extra2000/capev2-box/commit/7fbd7484e007e857a16e4884fdc284d5e0108385))
* **submodule:** Remove `cockpit-formula` in favor of `zabbix-agent-formula` ([88fa044](https://github.com/extra2000/capev2-box/commit/88fa0448c018327545bef515e432218f68a9720b))


### Documentations

* **README:** Add configurations for `/lib/systemd/system/cape-rooter.service` ([78a371c](https://github.com/extra2000/capev2-box/commit/78a371c39aaee16be006cd38ffa6e931b2535172))
* **README:** Add configurations for `/lib/systemd/system/cape-rooter.service` ([2dc45a4](https://github.com/extra2000/capev2-box/commit/2dc45a4409878fc72b829ae3317d40a94598e207))
* **README:** Add configurations for `/lib/systemd/system/cape.service` ([3643fde](https://github.com/extra2000/capev2-box/commit/3643fde1347a03dda107341b34b069f24f3b42d6))
* **README:** Add configurations for `/opt/CAPEv2/conf/auxiliary.conf` ([47d6f54](https://github.com/extra2000/capev2-box/commit/47d6f54672bd56717a3f10e38bb3b31b962359fa))
* **README:** Add configurations for `/opt/CAPEv2/conf/memory.conf` ([a1586ef](https://github.com/extra2000/capev2-box/commit/a1586efc2f83d282a1a3ec71689813a19a6247b5))
* **README:** Add configurations for `/opt/CAPEv2/conf/reporting.conf` ([11a0e61](https://github.com/extra2000/capev2-box/commit/11a0e616a162e26c0b643b203e103eee37e63b74))
* **README:** Add description to change Vagrant box memory from default 5GB to 12GB ([e2d1703](https://github.com/extra2000/capev2-box/commit/e2d1703aa8ec949c3ddd19bd1d2a2cc30dfebc9f))
* **README:** Add instruction to set timezone ([c02b239](https://github.com/extra2000/capev2-box/commit/c02b2393dc7726fd12e578396ffa2dc0e3773c8c))
* **README:** Add instructions to copy `zabbix-agent` and `filebeat` pillar files ([9510337](https://github.com/extra2000/capev2-box/commit/95103372a5ed0eb2194668b3f1a21a4c7e0effe0))
* **README:** Add instructions to fix `Volatility3` and `TRiD` ([466c1cb](https://github.com/extra2000/capev2-box/commit/466c1cba28facf709d3cd224dc9f19126664efda))
* **README:** Add more instructions for Maintenance ([50c1fa6](https://github.com/extra2000/capev2-box/commit/50c1fa62ad303ec093233991fbd2cbdefd842cd9))
* **README:** Improve and add more instructions for CAPEv2 agent ([884d1b9](https://github.com/extra2000/capev2-box/commit/884d1b9c3a4b5285c63bad77dc71e6af359514ab))
* **README:** Improve descriptions for `systemctl daemon-reload` ([cda11ae](https://github.com/extra2000/capev2-box/commit/cda11aef925301815335bb22289a96dced804974))
* **README:** Improve instructions for obtaining agent MAC Address for configuring static DHCP ([b386b0b](https://github.com/extra2000/capev2-box/commit/b386b0bd33c2074762c4a55597b299b406f57b56))
* **README:** Increase agent memory from 1GB to 4GB and from 1 vCPU to 2 vCPUs ([02b5f7f](https://github.com/extra2000/capev2-box/commit/02b5f7f516d1446c33c27cd218c2d4d882c8bc1e))
* **README:** Remove Section `Memory Lock` because this procedure is not practical and causing `cape-processor.service` failed with `Memory Error` ([3055225](https://github.com/extra2000/capev2-box/commit/3055225a1f3a901f998bb1b3801adde38460eb30))
* **README:** Update CAPEv2 installation instruction due to changes in `cape2.sh` script and also create `/var/log/capev2` to store CAPEv2 `journald` logs ([7e1da03](https://github.com/extra2000/capev2-box/commit/7e1da03a7dc180548256f50f11034f0e4bfb009f))
* **README:** Update configurations for `/lib/systemd/system/cape-processor.service` ([29419aa](https://github.com/extra2000/capev2-box/commit/29419aaba28045720f2d464f3776271501dbfdef))
* **README:** Update configurations for `/opt/CAPEv2/conf/api.conf` ([fe5ce60](https://github.com/extra2000/capev2-box/commit/fe5ce60a1afd165511c5d935157ac335a881b77b))
* **README:** Update configurations for `/opt/CAPEv2/conf/cuckoo.conf` ([9fdf511](https://github.com/extra2000/capev2-box/commit/9fdf511436a7c065d339afae506954fa85f38c1e))
* **README:** Update configurations for `/opt/CAPEv2/conf/kvm.conf` ([4c59d3c](https://github.com/extra2000/capev2-box/commit/4c59d3cb7014dfb5533a57c5ebf6d90617c73ab2))
* **README:** Update configurations for `/opt/CAPEv2/conf/processing.conf` ([ad3c229](https://github.com/extra2000/capev2-box/commit/ad3c2296ba4bf1c06664374dc537cfe51e1f785b))
* **README:** Update configurations for `/opt/CAPEv2/conf/web.conf` ([f115ee1](https://github.com/extra2000/capev2-box/commit/f115ee1c56200cc0f4f1673cdfda4252bf80e4fb))
* **README:** Update provision instructions due to `nginx` state have been replaced with `nginx-formula` and `cockpit-formula` have been removed in favor of `zabbix-agent-formula` ([8d91ac6](https://github.com/extra2000/capev2-box/commit/8d91ac656577d5f307deba76996a2ff5a7e31f14))
* **vagrant:** Add comments for port forwarding ([43a502f](https://github.com/extra2000/capev2-box/commit/43a502fc33ed81b0e681da057d8122dc13a6eb40))

### [1.2.2](https://github.com/extra2000/capev2-box/compare/v1.2.1...v1.2.2) (2021-01-28)


### Documentations

* **README:** Add `sudo systemctl daemon-reload` to apply changes in `/lib/systemd/system/cape-processor.service` ([2b44649](https://github.com/extra2000/capev2-box/commit/2b446493430efd17b1fddefccab88f83668c329b))

### [1.2.1](https://github.com/extra2000/capev2-box/compare/v1.2.0...v1.2.1) (2021-01-22)


### Performance Improvements

* **vagrant:** Increase memory from 4GB to 5GB ([37a4150](https://github.com/extra2000/capev2-box/commit/37a415040ff060daf5ee1845489ce30d23fd3eab))


### Documentations

* **README:** Add instruction to fine tune `cape-processor.service` via `/lib/systemd/system/cape-processor.service` ([73a4930](https://github.com/extra2000/capev2-box/commit/73a4930a7b38f54860430e3325b893e6d4dc5544))
* **README:** Increase memory limit for CAPEv2 services from 1GB to 2GB in `/etc/security/limits.conf` ([96b3d16](https://github.com/extra2000/capev2-box/commit/96b3d1645b831dd9ca64a07a61530bcb98298f27))

## [1.2.0](https://github.com/extra2000/capev2-box/compare/v1.1.1...v1.2.0) (2021-01-20)


### Features

* **submodule:** Update `cockpit-formula` to [v1.0.2](https://github.com/extra2000/cockpit-formula/releases/tag/v1.0.2) ([6599680](https://github.com/extra2000/capev2-box/commit/6599680c05f54e3c5abc62af929694bdd91946da))


### Continuous Integrations

* **AppVeyor:** Upgrade Ubuntu from `18.04` to `20.04` ([1414a17](https://github.com/extra2000/capev2-box/commit/1414a17a2fbca765c03964c8cb678fab48dca7e0))

### [1.1.1](https://github.com/extra2000/capev2-box/compare/v1.1.0...v1.1.1) (2021-01-15)


### Fixes

* **README:** Add `tags = x64` to `/opt/CAPEv2/conf/api.conf` ([e46a1f2](https://github.com/extra2000/capev2-box/commit/e46a1f25843a086874e4ee37bef0da959a825f46))
* **README:** Replace `systemctl restart` to `systemctl stop` and `systemctl restart` due to `cape.service` doesn't reload config via `systemctl restart` ([d4fa3ed](https://github.com/extra2000/capev2-box/commit/d4fa3ed069333dd23e8e344f73a312182c45a6b0))

## [1.1.0](https://github.com/extra2000/capev2-box/compare/v1.0.0...v1.1.0) (2021-01-10)


### Features

* **salt:** Add SaltStack implementations ([5353f09](https://github.com/extra2000/capev2-box/commit/5353f0905696c19673e459f981c07fc7973f7399))
* **submodule:** Add Cockpit Formula ([56b8883](https://github.com/extra2000/capev2-box/commit/56b8883993b12f7ed7b8a1f8720cf34f8c488d16))
* **submodule:** Update CAPEv2 ([87be809](https://github.com/extra2000/capev2-box/commit/87be809d9b1e0353a56f2bcca536af8b9a8cc8b3))


### Fixes

* **vagrant:** Remove `--copy-links` from `rsync` because CAPEv2 repo added a placeholder symlink file [data/yara/monitor/yara](https://github.com/kevoreilly/CAPEv2/blob/a04ad9e0a5135809d3ca1b0164f30f3d6cec459e/data/yara/monitor/yara) ([93d2731](https://github.com/extra2000/capev2-box/commit/93d27316bf73790730871bd3b17bfc783507315d))


### Documentations

* **README:** Add instruction to clean up old data ([0454e24](https://github.com/extra2000/capev2-box/commit/0454e24f6db6a3288ac3b61251e0b3263d824189))
* **README:** Add instruction to eject installation media ([299d6e3](https://github.com/extra2000/capev2-box/commit/299d6e327a68cc5126838cd815585da31bc573b3))
* **README:** Add instruction to lock memory to 1GB ([2f5e4cd](https://github.com/extra2000/capev2-box/commit/2f5e4cde6f80176a9d58cdafd43188cb84bcb58f))
* **README:** Add instructions for SaltStack, Cockpit, and NGINX ([2b65a47](https://github.com/extra2000/capev2-box/commit/2b65a47130aa535c3c3aa17881ec689d0540a8e6))
* **README:** Add instructions to increase disk storage ([61c2693](https://github.com/extra2000/capev2-box/commit/61c2693af88ac8fd302d7e83e092e8e90a9b76e0))
* **README:** Add systemd instruction to disable graphical boot ([78a804d](https://github.com/extra2000/capev2-box/commit/78a804d13d3d6d74c7d901508c126775a1ef3389))
* **README:** Improvde descriptions for changing NAT to Host-only network ([ff2ec79](https://github.com/extra2000/capev2-box/commit/ff2ec79859611e1ca748ac713bd26128e550e4df))
* **README:** Reduce `cuckoo1` memory from 2GB to 1GB ([c116fd8](https://github.com/extra2000/capev2-box/commit/c116fd8b426b8e173283c3a0fa7e349e001b82d9))
* **README:** Update README ([3418a8b](https://github.com/extra2000/capev2-box/commit/3418a8b8d3f75bf8bf4f2b7a9afbd09e92d9e1dc))

## 1.0.0 (2021-01-04)


### Features

* Add `doomedraven-tools` required for CAPEv2 installations ([93a01e5](https://github.com/extra2000/capev2-box/commit/93a01e5f45e419cead9222015323d5d26b4f7216))
* Add CAPEv2 submodule ([e32bbb5](https://github.com/extra2000/capev2-box/commit/e32bbb5ae79846e96c7160bf4da8d31f70c871dc))
* **vagrant:** Import Vagrant files from [extra2000/generic-box v1.3.0](https://github.com/extra2000/generic-box/releases/tag/v1.3.0) ([e071a47](https://github.com/extra2000/capev2-box/commit/e071a4794548bbb984efcb6ad0c6ea3ec45880f4))


### Continuous Integrations

* Add AppVeyor with `semantic-release` bot ([a7c84f7](https://github.com/extra2000/capev2-box/commit/a7c84f7764859178991f13a382c511da0e6cb4fb))


### Documentations

* **README:** Update `README.md` ([7420564](https://github.com/extra2000/capev2-box/commit/742056425290505b20aa8dac2f35f9e32ff433a2))
