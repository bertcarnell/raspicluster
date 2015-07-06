# Raspberry Pi B+ and BrickPi Setup Documentation

## Hardware

- Raspberry Pi Model B+ 512 MB
  - 700MHz Broadcom BCM2835 CPU / 512 MB SDRAM @ 400MHz
  - 40 pin extended GPIO
  - MicroSD slot
  - Multiple Ports: 4 USB ports, Full Size HDMI, 4 pole Stereo output and Composite video port, CSI camera port, DSI display port, 10/100 RJ45 Ethernet
  - Micro USB power source
- 2A Power supply
- 4GB MicroSD card

### Memory

```
pi@raspirobot ~ $ cat /proc/meminfo
MemTotal:         380780 kB
```

### Processor

```
pi@raspirobot ~ $ cat /proc/cpuinfo
processor       : 0
model name      : ARMv6-compatible processor rev 7 (v6l)
BogoMIPS        : 2.00
Features        : half thumb fastmult vfp edsp java tls
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xb76
CPU revision    : 7

Hardware        : BCM2708
Revision        : 0010
Serial          : 00000000bd278db2
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
  - `sudo apt-get update`
  - `sudo apt-get upgrade`
