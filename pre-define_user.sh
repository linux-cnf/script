#!/bin/bash
#purpose: bash script to create multiple users with pre-defined passwords at once.
#Read_Me: The import file should be in two columns, first users name and second passwords.
#author: Bablish Jaiswal
#contact: linux.cnf@gmail.com

    read -p "Kindly import/type Users Name-password file with location:- " creation_info
    cat $creation_info |while read i p
    do
            ( useradd  $i   &&  echo -e "${p}\n${p}" |  passwd  $i )  > /dev/null 2>&1 && echo $user ${i} created and password is ${p} || echo ${i} failed 
    done
