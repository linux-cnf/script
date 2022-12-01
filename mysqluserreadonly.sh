#!/bin/bash
#purpose: creating 20 users of mysql for readonly
#contact: linux.cnf@gmail.com

#generating strong password file
seq 20 |while read line ; do cat /dev/urandom |tr -dc "[[:graph:]]" |head -c16;echo ; done > pass

#single file with userame(username list is given) and password 
paste user pass  > usercred

#creating user with readonly grant\
cat usercred  |while read a b ; do echo -e "CREATE USER '$a'@'%' IDENTIFIED BY '$b';\nGRANT SELECT ON database1.* TO '$a'@'%';\nGRANT SELECT ON database2.* TO '$a'@'%';\nFLUSH PRIVILEGES;\nSHOW GRANTS FOR '$a'@'%'; " ; done
