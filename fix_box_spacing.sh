#!/bin/bash
perl -0777 -pe '
  s{box::use\(.*?\)}{
    ($r = $&) =~ s/ \/ /\//g;
    $r
  }gsem' < $1 > $2
