# Non-RaspberryPi Compute Node Set Up

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

1. Install Ubuntu 18.04 LTS Developer with minimal install
  - on the Dell PC, use F12 to enter the boot menu
2. Installation Configuration
  - User: `pi`
  - Password: `********`
  - Computer Name: `ThinkPad` and `Dell`
3. Pacakge installation
  - `sudo apt-get upgrade`
  - `sudo apt-get install subversion`
  - `sudo apt-get install git`
  - `sudo apt-get install openjdk-8-jre-headless`
  - `sudo apt-get install openssh-server` (To allow ssh into the node)
  - `sudo ssh restart`
  - `sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9`
  - `sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'`
  - `sudo apt-get update`
  - `sudo apt-get install r-base`
4. Remove unnecessary packages. (If the minimal install is used, this is unnecessary)
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
  - or from the command line
    - `sudo nano /etc/UPower/UPower.conf`
    - Change `IgnoreLid=false` to `true`
    - `service upower restart`
6. Allow the lid to be closed without disabling SSH
  - `sudo nano /etc/systemd/logind.conf`
    - change the `#HandleLidSwitch=suspend` to `HandleLidSwitch=ignore`
    - `sudo restart systemd-logind`

## install ganglia monitoring

1. `sudo apt-get install ganglia-monitor`
2. `sudo nano /etc/ganglia/gmond.conf`

 ```
cluster {
name = "raspicluster"
owner = "unspecified"
latlong = "unspecified"
url = "unspecified"
}

udp_send_channel {
#mcast_join = 239.2.11.71 ## comment out
host = 192.168.0.150
port = 8649
ttl = 1
}

/*udp_recv_channel {
mcast_join = 239.2.11.71
port = 8649
bind = 239.2.11.71
}*/
```

3. `sudo service ganglia-monitor restart`
