#! /usr/bin/env python

import csv

csv.register_dialect('custom',
                     delimiter='|',
                     doublequote=false,
                     escapechar=None,
                     quotechar='"',
                     quoting=csv.QUOTE_MINIMAL,
                     skipinitialspace=False)

with open('input.csv') as ifile:
    data = csv.reader(ifile, dialect='custom')
    print ("<lexique>")
    for record in data:
        print ("   <record>")
        for i, field in enumerate(record):
            print ("      <field%s>" % i + field + "</field%s>" % i)
        print "   <record>"
    print ("</lexique>")
