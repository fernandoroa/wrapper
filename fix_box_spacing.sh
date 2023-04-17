#!/bin/bash
tmpfile=$(mktemp)
perl -0777 -pe '
  s{box::use\(.*?\)}{
    ($r = $&) =~ s/ \/ /\//g;
    $r
  }gsem' < $1 > ${tmpfile}

if [ -z "$2" ] ; then
  cat ${tmpfile} > $1  
else 
  cat ${tmpfile} > $2
fi

rm -f ${tmpfile}