# Level01

On level00 we realiced that in /etc/passwd which is were
all passwords are stored in any linux based distribution
the password of flag01 wasnt encrypted

----------

```shell

┌──(kali㉿kali)-[~/Desktop/swc]
└─$ ssh -p 4242 level00@172.20.10.4
           _____                      _____               _     
          / ____|                    / ____|             | |    
         | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
          \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
          ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
         |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          172.20.10.4 
level01@172.20.10.4's password: x24ti5gi3x0ol2eh4esiuxias
level01@SnowCrash:~$ cat /etc/passwd
...
level14:x:2014:2014::/home/user/level14:/bin/bash
flag00:x:3000:3000::/home/flag/flag00:/bin/bash
flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
flag02:x:3002:3002::/home/flag/flag02:/bin/bash
flag03:x:3003:3003::/home/flag/flag03:/bin/bash
...

```
------
But `42hDRfypTqqnw` is not yet the password we are looking for
it still has some form of encryption.
For this part we will use the password cracker 'John the Ripper'

## John the Ripper

* Build Docker :

```shell
$ sudo docker build . -t "snowcrash-img"
```

* Run Docker Kali

```
$ sudo docker run -v $(pwd):/snowcrash/snowcrash --net host -ti snowcrash-img

```
* copy /etc/passwd on kali

```
┌──(kali㉿kali)-[~]
└─$ scp -P 4242 level01@192.168.1.25:/etc/passwd .                       1 ⨯
           _____                      _____               _     
          / ____|                    / ____|             | |    
         | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
          \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
          ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
         |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          192.168.1.25 2a01:cb00:47e:b300:7080:dd1c:c1c:c30d 2a01:cb00:47e:b300:a00:27ff:fece:8d2a 
level01@192.168.1.25's password: 
passwd                                     100% 2477     3.9MB/s   00:00    
                                                                            
```
* Use John

```zsh
┌──(kali㉿kali)-[~]
└─$ john passwd 
Created directory: /home/kali/.john
Using default input encoding: UTF-8
Loaded 1 password hash (descrypt, traditional crypt(3) [DES 256/256 AVX2])
Will run 2 OpenMP threads
Proceeding with single, rules:Single
Press 'q' or Ctrl-C to abort, almost any other key for status
Almost done: Processing the remaining buffered candidate passwords, if any.
Proceeding with wordlist:/usr/share/john/password.lst
'abcdefg'         ('flag01')     
1g 0:00:00:00 DONE 2/3 (2022-02-13 16:14) 33.33g/s 435333p/s 435333c/s 435333C/s 123456..Herman1
Use the "--show" option to display all of the cracked passwords reliably
Session completed. 
                   
```
----
## GETFLAG

```bash
┌──$ level01@SnowCrash:~$ su flag01
└─> Password: abcdefg
Don t forget to launch getflag !
┌──$ flag01@SnowCrash:~$ getflag
└─> Check flag.Here is your token : f2av5il02puano7naaf6adaaf
┌──$ level01@SnowCrash:~$ su level02
└─> Password: f2av5il02puano7naaf6adaaf
```
