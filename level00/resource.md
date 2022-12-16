# Level00

We first look for all the files in the system owned by flag00

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
level00@172.20.10.4's password: level00
┌──$ level00@SnowCrash:~$ find / -user flag00 -exec ls -l {} \; 2>/dev/null
|─>----r--r-- 1 flag00 flag00 15 Mar  5  2016 /usr/sbin/john
└─>----r--r-- 1 flag00 flag00 15 Mar  5  2016 /rofs/usr/sbin/john
┌──$ level00@SnowCrash:~$ find / -user flag00 -exec cat {} \; 2>/dev/null
└─>cdiiddwpgswtgt

```

_________

## DECRYPTION

[`Code Cesar`](https://www.dcode.fr/chiffre-cesar)

The Caesar code (or Caesar’s cipher) is a monoalphabetic substitution cipher, where each letter is replaced by another letter located a little further in the alphabet (thus offset but always identical for the same message). The offset distance is chosen from a number called the offset, which can be right (A to B) or left (B to A).

Alphabet                   | Alphabet of Caesar (ROT11)
-------------------------- | --------------------------
ABCDEFGHIJKLMNOPQRSTUVWXYZ | LMNOPQRSTUVWXYZABCDEFGHIJK

for decryption we used the command `tr`, this command allows to apply a processing on certain characters of a dataflow: deletion, substitutions ...

```bash
┌──$ level00@SnowCrash:~$ cat /usr/sbin/john | tr 'A-Za-z' 'L-ZA-Kl-za-k'
└─> nottoohardhere

```

## GETFLAG

```bash
┌──$ level00@SnowCrash:~$ su flag00
└─> Password: nottoohardhere
Don t forget to launch getflag !
┌──$ flag00@SnowCrash:~$ getflag
└─> Check flag.Here is your token : x24ti5gi3x0ol2eh4esiuxias
```
