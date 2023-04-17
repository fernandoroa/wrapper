#!/bin/bash
tmpfile=$(mktemp)
perl -0777 -pe '
  s{box::use\(.*?\)}{
    ($r = $&) =~ s/ \/ /\//g;
    $r
  }gsem' < $1 > ${tmpfile}

cat ${tmpfile} > $2
rm -f ${tmpfile}
