# Changelog

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
