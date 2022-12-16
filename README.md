# Snow-Crashs

Projet introductif à la sécurité en informatique, Snow Crash a pour but de faire découvrir la sécurité dans différents sous-domaines, avec une approche orientée développeur. Vous allez vous familiariser avec plusieurs langages (ASM/perl/php..), développer une certaine logique pour comprendre des programmes inconnus, et ainsi prendre conscience des problèmes liés à de simples erreurs de programmation . 

Skills:
* Adaptation & creativity.
* Security.
* Unix.

## Overview

|Partie obligatoire|                                 |
|---------|------------------------------------------|
| Level00 | `Dechiffrage` - [Code Cesar](https://www.dcode.fr/chiffre-cesar)|
| Level01 | `Crack Password` - [John The Ripper](https://www.openwall.com/john/)|
| Level02 | `Flux TCP Analyse .pcap` - [Wireshark](https://www.wireshark.org)|
| Level03 | ``Exploit PATH or symlink bin vulnerability`` |
| Level04 | `Exploit script perl`                    |
| Level05 | `cron exec bin`                          |
| Level06 | `Exploit REGEX php`                      |
| Level07 |` Exploit env var `                       |
| Level08 |` strstr rename Token `                   |
| Level09 |` Reverse hash `                          |
______________________
              
|Partie Bonus|                                       |
|---------|------------------------------------------|
| Level10 | ` .....? `                               |
| Level11 | ` .....? `                               |
| Level12 | ` .....? `                               |
| Level13 | ` .....? `                               |
| Level14 | ` .....? `                               |
_______________________

## Docker
___
A Docker container built from the Dockerfile:
  
```sh

$ sudo docker build . -t "snowcrash-img"

$ sudo docker run -v $(pwd):/snowcrash/snowcrash --net host -ti snowcrash-img

```
