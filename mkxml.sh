#!/bin/bash

INFILE=vocabulaire.tsv
OUTFILE=julalexique.xml
echo "<lexique>" > $OUTFILE

cat $INFILE | \
while IFS=$'\t' read -r -a current;
#	jula="${current[0]}"; french="${current[1]}"; examplej="${current[5]}"; examplef="${current[6]}"
do
	while [ "${current[0]}" != "${previous[0]}" ];
		do
			#this is a new jula word
			jula="${current[0]}"
			printf "<item>\n" >> $OUTFILE
			printf "\t<jula>${jula}</jula>\n" >> $OUTFILE
			previous[0]=${current[0]}

	  	while [ "${current[1]}" != "${previous[1]}" ];
				do
	  #this is a new definition
				french="${current[1]}"
				hint="${current[4]}"
				speech="${current[5]}"
				printf "\t<french>\n\t\t<translations>\n\t\t\t<definition>${french}<definition>\n<hint>$hint<hint>\n" >> $OUTFILE
				previous[1]=${current[1]}

        if [ ! -z "${current[3]}" ];then
	  			while [ "${current[3]}" != "${previous[3]}" ];
	 					do
							printf "\t\t\t\t<speech>\n\t\t\t\t\t\t<type>$speech</type>\n" >> $OUTFILE
							previous[3]=${current[3]}
					done
				fi
			done

  if [ ! -z "${current[5]}" ];then
		examplef="${current[5]}"
		fi
		done
	done

	#previous=("${current[@]}")
echo "</lexique>" >> $OUTFILE
