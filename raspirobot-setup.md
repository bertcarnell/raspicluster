# Raspberry Pi B+ and BrickPi Setup Documentation

## Hardware

*Update*

- Raspberry Pi Model B+ 1 GB
  - 700MHz Broadcom BCM2835 CPU / 512 MB SDRAM @ 400MHz
  - 40 pin extended GPIO
  - MicroSD slot
  - Multiple Ports: 4 USB ports, Full Size HDMI, 4 pole Stereo output and Composite video port, CSI camera port, DSI display port, 10/100 RJ45 Ethernet
  - Micro USB power source
- 2A Power supply
- 4GB MicroSD card

### Memory

*Needs Update*

```
pi@N01 ~ $ cat /proc/meminfo
MemTotal:         949408 kB
```

### Processor

*Needs Update*

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
    - Obtain the OS image `2015.03.20_Dexter_Industries_wheezy.img`
    - Use Win32DiskImager to put the OS image on the MicroSD card
    - Eject the MicroSD card and insert it into the RaspberryPi
2. Boot the RaspberryPi
  - Set up the RaspberryPi with a monitor (HDMI), keyboard (USB), and internet connection (WiFi USB or Ethernet)
  - Plug in the power, the RaspberryPi should boot and should initially start in the `raspi-config` screen
3. Configure the RaspberryPi
  - Expand the file system
  - Internationalization Options
    - Change Locale: en_US.UTF-8 UTF-8
    - Change Time Zone: US, Eastern
  - Advanced Options
    - Hostname: raspirobot
    - SSH: enable
  - Finish
4. Reboot
5. Install packages
  - `sudo apt-get upgrade`
