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
    - Obtain the OS image `2015-05-05-raspibian-wheezy.img`
    - Use Win32DiskImager to put the OS image on the MicroSD card
    - Eject the MicroSD card and insert it into the RaspberryPi2
2. Boot the RaspberryPi2
  - Set up the RaspberryPi2 with a monitor (HDMI), keyboard (USB), and internet connection (WiFi USB or Ethernet)
  - Plug in the power, the RaspberryPi2 should boot and should initially start in the `raspi-config` screen
3. Configure the RaspberryPi2
  - Change the user password to ********
  - Enable 

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

