#!/bin/sh

curl 'http://timetable.unsw.edu.au/2019/COMP3231.html' > tmp.html
nums=`egrep -o '[0-9]{3}/[0-9]{3}' tmp.html | cut -d '/' -f1 | uniq`
echo "$nums"
out_of=`egrep -o '[0-9]{3}/[0-9]{3}' tmp.html | cut -d '/' -f2 |  uniq`
echo "$out_of"
if test $nums -lt $out_of
then
	echo "GO AND ENROL IN OS NOW!" > body
	mailx -s "URGENT! SPOT AVAILABLE IN OS!" "anshitaggarwal2000@gmail.com" < body
fi

curl 'http://timetable.unsw.edu.au/2019/COMP6441.html' > tmp2.html
nums=`egrep -o '[0-9]{3}/[0-9]{3}' tmp2.html | cut -d '/' -f1 | uniq`
echo "$nums"
out_of=`egrep -o '[0-9]{3}/[0-9]{3}' tmp2.html | cut -d '/' -f2 |  uniq`
echo "$out_of"
if test $nums -lt $out_of
then
	echo "GO AND ENROL IN SECURITY NOW!" > body
	mailx -s "URGENT! SPOT AVAILABLE IN SECURITY!" "anshitaggarwal2000@gmail.com" < body
fi



