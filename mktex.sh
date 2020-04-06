#!/bin/bash
INFILE=vocabulaire.tsv
OUTFILE=julalexique.tex
cat $INFILE | \
while IFS=$'\t' read -r -a arr;
do
	  echo "${arr[0]}  ${arr[1]}  ${arr[2]} ${arr[3]}" 
done
