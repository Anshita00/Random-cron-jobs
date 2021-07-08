#!/usr/bin/env bash

declare -a subjects=( "COMP3231" "COMP6441" )
export my_email="anshitaggarwal2000@gmail.com"

for subject in "${subjects[@]}"
do
    echo $subject
    curl -s "http://timetable.unsw.edu.au/2019/$subject.html" > t_table.html
    nums=`egrep -o '[0-9]{3}/[0-9]{3}' t_table.html | cut -d '/' -f1 | uniq`
    out_of=`egrep -o '[0-9]{3}/[0-9]{3}' t_table.html | cut -d '/' -f2 |  uniq`
    echo "Seats taken: $nums, Total seats: $out_of"
    if test $nums -lt $out_of
    then
        echo "GO AND ENROL IN $subject NOW!" | mailx -s "URGENT! SPOT AVAILABLE IN $subject!" "$my_email"
    fi
    rm t_table.html
done
