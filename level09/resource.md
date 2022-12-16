# level09

We found a executable and a file "token".

```
flag08@SnowCrash:~$ su level09
Password: 
level09@SnowCrash:~$ ls
level09  token
level09@SnowCrash:~$ ls -la
total 24
dr-x------ 1 level09 level09  140 Mar  5  2016 .
d--x--x--x 1 root    users    340 Aug 30  2015 ..
-r-x------ 1 level09 level09  220 Apr  3  2012 .bash_logout
-r-x------ 1 level09 level09 3518 Aug 30  2015 .bashrc
-rwsr-sr-x 1 flag09  level09 7640 Mar  5  2016 level09
-r-x------ 1 level09 level09  675 Apr  3  2012 .profile
----r--r-- 1 flag09  level09   26 Mar  5  2016 token
```
First thing we try execute:

```
level09@SnowCrash:~$ cat token 
f4kmm6p|=�p�n��DB�Du{��
level09@SnowCrash:~$ cat -e token 
f4kmm6p|=M-^B^?pM-^BnM-^CM-^BDBM-^CDu{^?M-^LM-^I$
level09@SnowCrash:~$ ./level09 token 
tpmhr

```

Using ltrace:

```

level09@SnowCrash:~$ ltrace ./level09 token
__libc_start_main(0x80487ce, 2, 0xbffff7d4, 0x8048aa0, 0x8048b10 <unfinished ...>
ptrace(0, 0, 1, 0, 0xb7e2fe38)                               = -1
puts("You should not reverse this"You should not reverse this
)                          = 28
+++ exited (status 1) +++
```

"You should not reverse this" - gives idea that output can be reversed.

```
hexdump -C token 
00000000  66 34 6b 6d 6d 36 70 7c  3d 82 7f 70 82 6e 83 82  |f4kmm6p|=..p.n..|
00000010  44 42 83 44 75 7b 7f 8c  89 0a                    |DB.Du{....|
0000001a

```

```
./level09 cucarachos
cvedvfiow|
level09@SnowCrash:~$ ./level09 "hola mundo"
hpnd$r{ulx

```

```
./level09 abcdefghijklmnopqrstuvwxyz >/tmp/lol.txt

hexdump -C  /tmp/lol.txt
00000000  61 63 65 67 69 6b 6d 6f  71 73 75 77 79 7b 7d 7f  |acegikmoqsuwy{}.|
00000010  81 83 85 87 89 8b 8d 8f  91 93 0a                 |...........|
0000001b


```

It seems that the executable waits for a string as argument and encodes it
so the token with a "hashed" string. The hash method is argv[i] + i ;
we can make a script to decode the hashing of the token

```
#include <stdio.h>
#include <string.h>

void    main(void)
{
        char    str[100];
        int     i = -1;

        bzero(str, 100);
        scanf("%s", str);

        while (str[++i])
                printf("%c", str[i] - i);
        printf("\n");
}
```
With this simple c program we manage to decode it.

....


```
level09@SnowCrash:~$ su flag09
Password: f3iji1ju5yuevaus41q1afiuq
Don't forget to launch getflag !
flag09@SnowCrash:~$ getflag
Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z

```
Finally we get the last token :))
