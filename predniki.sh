#!/usr/bin/env bash
#program dela a jebe avtomatski test nabijem na kurac
koncni=""

count=0

kam=$1
cd /proc/$kam
#če dam [$kam -gt 0] pa dobim error na testu [: -gt: pričakuje se enosnoven operator
while (($kam > 0)) #to mi pa da error ((: > 0: skladenjska napaka: pričakovan operand (žeton napake je "> 0")
  do
    if [[ "$count" > "0" ]]
    then
      koncni="$koncni<---"
    fi

    j=0
    temp_j=0
    d=0
    paid=""

    cd ..
    cd $kam

    paid=$( cat stat )

    while [[ "${paid:j:1}" != " " ]]
    do

      j=$((j+1))

    done

    temp_j=$j+2

    while [[ "${paid:j:1}" != "S" ]]
    do

      j=$((j+1))
    done


  j=$j-2
  koncni="$koncni${paid:temp_j:j-temp_j}(${paid:0:temp_j-2})"
  j=$j+4

  d=1

  while [[ "${paid:j:1}" != " " ]]
  do

  d=$((d+1))
  j=$((j+1))

  done

  kam="${paid:j-d:d}"
  count=count+1

  done

echo $koncni
