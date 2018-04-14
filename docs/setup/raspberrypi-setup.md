# Raspberry Pi 2 Setup Documentation

## Hardware

- Raspberry Pi 2 Model B 1 GB
  - QUAD Core Broadcom BCM2836 CPU with 1 GB RAM
  - 40 pin extended GPIO
  - MicroSD slot
  - Multiple Ports: 4 USB ports, Full Size HDMI, 4 pole Stereo output and Composite video port, CSI camera port and DSI display port
  - Micro USB power source
- 2A Power supply
- 8GB MicroSD card

### Memory

```
pi@N01 ~ $ cat /proc/meminfo
MemTotal:         949408 kB
```

Approx 0.9 GB

```
pi@N01:~ $ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        30G  2.7G   26G  10% /
devtmpfs        459M     0  459M   0% /dev
tmpfs           463M     0  463M   0% /dev/shm
tmpfs           463M  6.2M  457M   2% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           463M     0  463M   0% /sys/fs/cgroup
/dev/mmcblk0p1   63M   21M   43M  33% /boot
```

### Processor

```
pi@N01 ~ $ cat /proc/cpuinfo
...
model name      : ARMv7 Processor rev 5 (v7l)
BogoMIPS        : 38.40
Features        : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xc07
CPU revision    : 5

Hardware        : BCM2709
Revision        : a21041
Serial          : 00000000dbfe5a08
```

## Installation Notes

1. Install operating system on the MicroSD card
  - On Windows 8.1
    - Quick Format the MicroSD card
    - Obtain Win32DiskImager and install
    - Obtain the OS image `2016-05-27-raspbian-jessie-lite.img`
    - Use Win32DiskImager to put the OS image on the MicroSD card
    - Eject the MicroSD card and insert it into the RaspberryPi2
2. Boot the RaspberryPi2
  - Set up the RaspberryPi2 with a monitor (HDMI), keyboard (USB), and internet connection (WiFi USB or Ethernet)
  - If necessary, the default login is user: pi, password: raspberry
  - Plug in the power, the RaspberryPi2 should boot and should initially start in the `raspi-config` screen.  if not use `sudo raspi-config`.
3. Configure the RaspberryPi2
  - Change the user password to ********
  - Boot Options:  B1 Console
  - Localisation Options
    - Change Locale: en_US.UTF-8 UTF-8 and then select en_US-UTF-8
    - Change Time Zone: US, Eastern
    - Change Keyboard Layout: English US
  - Network Options
    - Hostname: N01, N02, N03, etc
  - Advanced Options
    - Expand the file system (if necessary)
  - Interfacing Options:
    - SSH: enable
  - Finish
4. Reboot
5. Install packages
  - `sudo apt-get update`
  - `sudo apt-get upgrade`
  - `sudo apt-get install openmpi-bin` (if needed openmpi-dev)
6. Install R from Source to use a more updated version than that available with Jessie
  - `sudo nano /etc/apt/sources.list`
      - uncomment the line that starts `#deb-src`
  - `sudo apt-get update`
  - `sudo apt-get build-dep r-base` to ensure the right dependencies are there for R without installing the older version with Jessie
  - `sudo apt-get install subversion` to get the R svn checkout
  - `sudo apt-get install rsync` to get the recommended R packages
  - `sudo apt-get install libcurl4-openssl-dev` to meet the requirements in R configure for curl.h
  - `mkdir ~/repositories`
  - `svn checkout https://svn.r-project.org/R/branches/R-3-3-branch ~/repositories/R3.3.patched`
  - `cd R3.3.patched`
  - `./tools/rsync-recommended`
  - `mkdir ~/repositories/R3.3.patched.build`
  - `cd ~/repositories/R3.3.patched.build`
  - `../R3.3.patched/configure`
  - `make` this will take multiple hours
  - `make check` this is optional and is most necessary when building for a new architecture
  - `sudo make install`

## Ganglia

Follow [these](https://github.com/bertcarnell/raspicluster/blob/master/docs/setup/computenode-setup.md#install-ganglia-monitoring) directions

## Acronyms

- GB = gigabyte
- CPU = Central Processing Unit
- RAM = Random Access Memory
- GPIO = General Purpose Input Output
- MicroSD = Micro Secure Digital (removable flash memory)
- USB = Universal Serial Bus
- HDMI = High Definition Multimedia Interface
- CSI = Camera Serial Interface
- DSI = Display Serial Interface
- OS = Operating System

