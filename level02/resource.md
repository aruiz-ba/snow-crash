# level02

First thing we notice is that theres a file in the home
directory of user "level02"
Its called "level02.pcap".
If we try to see the content with cat we just get weird characters on screen

``` bash
........................
           BB$E4��@@r;���;���/Y�O���%������
@@J;���;��ߙO/Y�����%�s�
��N�0af&N�$BB$E4��@@q;���;���/Y�O���%�����
�N��af&N��C'$E5�@@J;���;��ߙO/Y�����%�s��
��N�Laf&N�BB$E4��@@p;���;���/Y�O���%�����
          CC$E5��@@l;���;���/Y�O���(����ۚ
�R}Jdf&N�$
          B'$E4�@@J;���;��ߙO/Y�����)�s��
^�R}df&N8%
          ee$EW��@@I;���;���/Y�O���)����ݜ
........................

```

A quick search on the internet tell us that network analyzers like Wireshark create .pcap files to collect and record packet data from a network.

* Build Docker :

```shell
$ sudo docker build . -t "snowcrash-img"
```

* Run Docker Kali

```
$ sudo docker run -v $(pwd):/snowcrash/snowcrash --net host -ti snowcrash-img

```
* copy level02.pcap file on kali

```
┌──(kali㉿kali)-[~]
└─$ scp -P 4242 level02@192.168.1.25:/home/user/level02/level02.pcap .
           _____                      _____               _     
          / ____|                    / ____|             | |    
         | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
          \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
          ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
         |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                        
  Good luck & Have fun

          192.168.1.25 2a01:cb00:47e:b300:7080:dd1c:c1c:c30d 2a01:cb00:47e:b300:a00:27ff:fece:8d2a 
level02@192.168.1.25's password: 
level02.pcap                                                        100% 8302    11.1MB/s   00:00    
```                                                                                                     

* wireshark

```
┌──(kali㉿kali)-[~]
└─$ chmod +r level02.pcap 
                                                                                                      
┌──(kali㉿kali)-[~]
└─$ wireshark level02.pcap

```
We open the file with wireshark and now we get a bunch of information in hexadecimal,
but between all of them we can read some legible words like "password:"
If we continue analyzing the data just after this we get what seems to be the output of a keylogger

```
	66 74 5f 77 61 6e 64 72 7f  7f  7f   4e 44 52 65 6c 7f   4c 30 4c 
	f  t  _  w  a  n  d  r  Del Del Del  N  D  R  e  l  Del  L  0  L
```

If we count the Del keys we get "ft_waNDReL0L"
BINGO!! is the password of flag02!!!

----
## GETFLAG

```bash
┌──$ level02@SnowCrash:~$ su flag02
└─> Password: ft_waNDReL0L
Don t forget to launch getflag !
┌──$ flag02@SnowCrash:~$ getflag
└─> Check flag.Here is your token : kooda2puivaav1idi4f57q8iq
┌──$ level02@SnowCrash:~$ su level03
└─> Password: kooda2puivaav1idi4f57q8iq
level02@SnowCrash:~$ su flag02
```
