#!/bin/sh

#touch latest.zip
LP=linearizedb.pages.dev
last=00149
#$(wget -qO - $LP/last.txt | grep -o '[0-9]\+')
for i in $(seq -w 00000 $last); do wget -q $LP/blk$i.dat >/dev/null && echo $i; done
LP=lin.anyone.eu.org
for i in $(seq -w $last 21909); do wget -q $LP/blk$i.dat >/dev/null && echo $i; done
#wget -nH -e robots=off -nc -rl inf --no-remove-listing https://prunednode.today
ls -t *.dat | head -1 > last.txt
ls | grep -v '.dat$' | while read f; do echo "<a href=\"$f\">$f</a><br>"; done > index.html
