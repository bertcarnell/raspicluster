# Compute Node Set Up

## Hardware

- IBM ThinkPad Core2 Duo

### Memory

```
pi@ThinkPad:~$ cat /proc/meminfo
MemTotal:        2014572 kB
```

### Processor

```
pi@ThinkPad:~$ cat /proc/cpuinfo
...
vendor_id       : GenuineIntel
cpu family      : 6
model           : 15
model name      : Intel(R) Core(TM)2 Duo CPU     T5870  @ 2.00GHz
stepping        : 13
microcode       : 0xa3
cpu MHz         : 800.000
cache size      : 2048 KB
...
cpu cores       : 2
...
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm lahf_lm ida dtherm
```

## Installation Notes

1. Install Ubuntu 14.04 LTS Developer
  - on the Dell PC, use F12 to enter the boot menu
2. Installation Configuration
  - User: `pi`
  - Password: `********`
  - Computer Name: `ThinkPad` and `Dell`
3. Pacakge installation
  - `sudo apt-get upgrade`
  - `sudo apt-get install r-base` (R 3.0.2)
  - `sudo apt-get install subversion`
  - `sudo apt-get install git`
  - `sudo apt-get install openjdk-7-jre-headless`
  - `sudo apt-get install openssh-server` (To allow ssh into the node)
  - `sudo ssh restart`
4. Remove unnecessary packages.
  - From the Ubuntu software center:
    - Installed
      - Office
        - LibreWriter
      - Internet
        - Thunderbird Mail
        - Empathy Internet Messaging
        - Browser-app
      - Graphics
        - Libre Draw
        - Simple Scan
        - Photo Manager
      - Games
        - Remove all
5. Allow the lid to be closed without suspending
  - Ubuntu, System Settings
    - Power
      - When lid is closed, when plugged in
        - do nothing


Also fixed lid closing

Don't know if you're still looking for this, but to disable entering the sleep mode I had to edit the /etc/systemd/logind.conf file and modified the line:

"#HandleLidSwitch=suspend"

to

HandleLidSwitch=ignore

Then rebooted.

sudo restart systemd-logind


Also installed libopenmpi-dev

