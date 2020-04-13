#!/usr/bin/bash
zathura '/var/home/bkelly/Documents/Books/Jula/pdf/Lexique Dioula.pdf' & 
git add vocabulaire.xml git commit -q -m "starting work on vocabulaire $(date)"
nvim vocabulaire.xml

