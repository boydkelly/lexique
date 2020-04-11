#!/bin/bash
INFILE=vocabulaire.tsv
OUTFILE=julalexique.xml
echo "<lexique>" > $OUTFILE

cat $INFILE | \
while IFS=$'|' read -r -a current;
jula="${current[0]}"; french="${current[1]}"; hint="${current[2]}; speech="${current[3]}; examplej="${current[5]}"; examplef="${current[6]}"
do
	while [ "${jula[0]}" != "${current[0]}" ];
	do
		#this is a new jula word
		jula="${current[0]}"
		printf "<item>\n" >> $OUTFILE
		printf "\t<jula>${jula}</jula>\n" >> $OUTFILE

  	while [ "${current[1]}" != "${previous[1]}" ];
		do
			echo current:"${current[0]}" 
			echo current:"${current[1]}" 
			echo previous:"${previous[1]}" 
	  #this is a new definition
			french="${current[1]}"
			hint="${current[2]}"
			speech="${current[3]}"
			printf "\t<french>\n\t\t<translations>\n\t\t\t<definition>${french}<definition>\n\\t\t\t<hint>${hint}<hint>\n" >> $OUTFILE

      if [ ! -z "${current[3]}" ];then
  			while [ "${current[3]}" != "${previous[3]}" ];
				do
#	echo current:"${current[3]}" 
#	echo previous:"${previous[3]}" 
					printf "\t\t\t<speech>\n\t\t\t\t\t\t<type>$speech</type>\n" >> $OUTFILE
					previous[3]=${current[3]}
				done
			fi
		previous[1]=${current[1]}
		done
	previous[0]=${current[0]}
	done
done

	#previous=("${current[@]}")
echo "</lexique>" >> $OUTFILE
