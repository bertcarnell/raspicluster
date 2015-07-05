# Compute Node Set Up

## Hardware

- Dell AMD dual core

### Memory

*Needs Update*
```
pi@ThinkPad:~$ cat /proc/meminfo
MemTotal:        2014572 kB
```

### Processor

*Needs Update*
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

1. Follow the directions for the compute node
2. Add openmpi development headers
  - `sudo apt-get install libopenmpi-dev`
  
