# Head Node Set Up

## Hardware

- XXXXXX Dell AMD dual core

### Memory

*Needs Update*

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
3. google-authenticator will display a secret key that you can add to the app on the phone.  Finally, it will display scratch codes in case your phone is not avaialble.
4. Require google-authenticator in ssh:
    - `sudo nano /etc/pam.d/sshd`
    - add this line to the file at the end: `auth required pam_google_authenticator.so`
    - `sudo nano /etc/ssh/sshd_config`
    - Change this parameter to yes `ChallengeResponseAuthentication yes`
    - Also, disallow root logins from the WWW `PermitRootLogin no`
5. Restart SSH: `sudo service ssh restart`

## Generate Keys to allow ssh to compute nodes without a password

1. `ssh-keygen`
    - accept default: <Enter>
    - no passphrase: <Enter>, <Enter again>
    - key fingerprint is displayed
2. SSH copy
    - `ssh-copy-id pi@192.168.0.151` 
    - `ssh-copy-id pi@192.168.0.152` 
    - `ssh-copy-id pi@192.168.0.153` 
    - `ssh-copy-id pi@192.168.0.154` 
    - `ssh-copy-id pi@192.168.0.155` 

## Set up [Ganglia](https://sourceforge.net/projects/ganglia/) for cluster monitoring

See this [tutorial](https://www.digitalocean.com/community/tutorials/introduction-to-ganglia-on-ubuntu-14-04) for more information.

1. `sudo apt-get install ganglia-monitor rrdtool gmetad ganglia-webfrontend`
2. `sudo cp /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/ganglia.conf`
3. `sudo nano /etc/ganglia/gmetad.conf`
    - Change this line `data_source "my cluster" localhost` to `data_source "raspicluster" 60 localhost 192.168.0.151 192.168.0.152 192.168.0.153 192.168.0.154 192.168.0.155`
4. `sudo nano /etc/ganglia/gmond.conf`
    - Create this cluster section and other edits:

 ```
cluster {
  name = "raspicluster"
  owner = "bertcarnell"
  latlong = "39.9612 N, 82.9988 W"
  url = "https://github.com/bertcarnell/raspicluster"
}

udp_send_channel {
  #mcast_join = 239.2.11.71 ## comment out
  host = localhost ## add
  port = 8649
  ttl = 1
}

udp_recv_channel {
  #mcast_join = 239.2.11.71 ## comment out
  port = 8649
  #bind = 239.2.11.71 ## comment out
}
```

5. `sudo service ganglia-monitor restart`
6. `sudo service gmetad restart`
7. `sudo service apache2 restart`
8. From any network system `http:\\192.168.0.150\ganglia`

## Edit the /etc/hosts for domain name resolution

1. `sudo nano /etc/hosts`
2. add these lines and save

```
192.168.0.151 N01
192.168.0.152 N02
192.168.0.153 N03
192.168.0.154 N04
192.168.0.155 N05
```
