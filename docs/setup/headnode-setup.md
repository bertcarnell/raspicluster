# Head Node Set Up

## Hardware

- Dell AMD dual core

### Memory

```
pi@Dell:~$ cat /proc/meminfo
MemTotal:        1919088 kB
```

### Processor

*Needs Update*
```
pi@Dell:~$ cat /proc/cpuinfo
...
vendor_id       : AuthenticAMD
cpu family      : 15
model           : 104
model name      : AMD Athlon(tm) 64 X2 Dual-Core Processor TK-53
stepping        : 1
cpu MHz         : 800.000
cache size      : 256 KB
...
cpu cores       : 2
...
```

## Installation Notes

1. Follow the directions for the compute node
2. Add openmpi development headers
  - `sudo apt-get install libopenmpi-dev`
  
## Setup the SSH to allow secure connections from the WAN

For a more full discussion, see this article:  [HowToGeek](http://www.howtogeek.com/121650/how-to-secure-ssh-with-google-authenticators-two-factor-authentication/)

1. Install Google Authenticator on your phone and setup an account
    - `sudo apt-get install libpam-google-authenticator`
2. As each user that you want to allow, run `google-authenticator`
    - Time based: y
    - Update file: y
    - disallow multiple uses: n
    - increase window: n
    - rate limit: y
3. google-authenticator will display a secret key that you can add to the app on the phone.  It will also show a verification key which should match the first code generated.  Finally, it will display scratch codes in case your phone is not avaialble.
4. Require google-authenticator in ssh:
    - `sudo gedit /etc/pam.d/sshd`
    - add this line to the file at the end: `auth required pam_google_authenticator.so`
    - close gedit
    - `sudo /etc/ssh/sshd_config`
    - Change this parameter to yes `ChallengeResponseAuthentication yes`
    - Also, disallow root logins from the WWW `PermitRootLogin no`
5. Restart SSH: `sudo service ssh restart`

