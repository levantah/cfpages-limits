#!/bin/sh

#touch latest.zip
LP=linearizedb.pages.dev
#last=00149
last=$(wget -qO - $LP/last.txt | grep -o '[0-9]\+')
for i in $(seq -w 00000 $last)
do
  wget -q $LP/blk$i.dat >/dev/null && { gzip -9 $i; echo $i; }
done
LP=lin.anyone.eu.org
new=$(echo $last | sed 's/^0\+//')
new=$((new+2))
max=21909
echo Now the new ones until $new

for i in $(seq -w $last $new)
do
  wget -q $LP/blk$i.dat.gz >/dev/null && echo $i
done

#wget -nH -e robots=off -nc -rl inf --no-remove-listing https://prunednode.today
ls *.dat | sort -nr | head -1 > last.txt
ls | grep -v '.dat$' | while read f; do echo "<a href=\"$f\">$f</a><br>"; done > index.html
