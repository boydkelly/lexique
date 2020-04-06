#!/bin/bash
INFILE=vocabulaire.tsv
OUTFILE=julalexique.tex
cat $INFILE | \
while read line
do
	  line=( ${line//\t/ } )
	  echo "0: ${line[0]}, 1: ${line[1]}, all: ${line[@]}" 
done
