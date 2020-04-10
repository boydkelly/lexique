#!/bin/bash

INFILE=vocabulaire.tsv
OUTFILE=julalexique.tex
echo "\documentclass[a4paper,12pt]{article}
\usepackage{tabularx,enumitem,ragged2e,tex4ebook}
\usepackage{fontspec}
\setmainfont{arimo}
\usepackage[margin=25mm,showframe]{geometry}
% Automatic line breaking and hanging indentation in 1st col.:
\newcolumntype{P}[1]{>{\RaggedRight\arraybackslash%
	\hangafter=1\hangindent=1em}p{#1}}
% Define custom enumerated and itemized list environments:
\newlist{definition}{enumerate}{1}
\setlist[definition,1]{nosep,wide=0pt,label=\arabic*),
		before=\begin{minipage}[t]{\hsize},
		after =\end{minipage}\vspace{10pt}}
\newlist{examples}{itemize}{1}
\setlist[examples,1]{label=-,after=\vspace{20pt}}

\begin{document}
\noindent
\begin{tabularx}{\textwidth}{@{} P{5cm} X @{}}
" > $OUTFILE

cat $INFILE | \
while IFS=$'\t' read -r -a current;
#	jula="${current[0]}"; french="${current[1]}"; examplej="${current[5]}"; examplef="${current[6]}"
do
	while [ "${current[0]}" != "${previous[0]}" ];
		do
			#this is a new jula word
			jula="${current[0]}"
			#current=( "${new_cur[@]}" )
			previous[0]=${current[0]}
			echo "${jula} &" >> $OUTFILE

	  while [ "${current[1]}" != "${previous[1]}" ];
		do
	  #this is a new definition
			french="${current[1]}"
			previous[1]=${current[1]}
    	echo "\begin{definition}
  \item ${french}
" >> $OUTFILE

  if [ ! -z "${current[5]}" ];then
		examplef="${current[5]}"
		echo "\begin{examples}
  \item ${examplej}

	${examplef}
" >> $OUTFILE
		fi
		done
	done

 	 if [ "${french}" = "${previous[1]}" ];then
		#this is another example for the same definition (french)
		#we need another example
echo "\item ${examplej}

	${examplef}
" >> $OUTFILE
		fi

	previous=("${current[@]}")
done
