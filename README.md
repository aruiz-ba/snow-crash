# Snow-Crash

his project is an introduction to computer security. Snow Crash will make you
discover security in various sub-domains, with a developer-oriented approach.
You will become familiar with several languages (ASM/perl/php…), develop a
certain logic to understand unknown programs, and become aware of problems
linked to simple programming errors.

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
