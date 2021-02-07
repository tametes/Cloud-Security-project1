#!/bin/bash
name='jake'
echo "hello $name."
echo -e "\nThis is my script. \n"
echo -e "The files in $PWD are: \n$(ls)"
echo -e "\ncopying the passwd file to your current directory.\n"
cp /etc/passwd $PWD
echo -e "the files in $pwd are now: \n$(ls)"
echo ""
echo "Have blessed day!"
