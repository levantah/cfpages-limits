#!/bin/sh

ls
echo "##################################################"
#touch latest.zip
LP=https://linearizedb.pages.dev
#last=00313
last=$(wget -qO - $LP/last.txt | grep -o '[0-9]\+')
for i in $(seq -w 00000 $last)
do
  wget -q $LP/blk$i.dat.gz >/dev/null && echo $i.gz
done

########################################
LP=https://lin.anyone.eu.org
new=$(echo $last | sed 's/^0\+//')
new=$((new+2))
max=21909
echo Now the new ones until $new

for i in $(seq -w $last $new)
do
  test -r blk$i.dat.gz && continue
  wget -q $LP/blk$i.dat.gz >/dev/null && echo $i.gz
done

#wget -nH -e robots=off -nc -rl inf --no-remove-listing https://prunednode.today
ls *.dat.gz | sort -nr | head -1 > last.txt
ls | grep -v '.dat.gz$' | while read f; do echo "<a href=\"$f\">$f</a><br>"; done > index.html
