# 1 modifies only CODE !!! (not comments)
# doesn't modify code followed by #
perl wrapper.pl < long_lines.R 100 ^\(\(?\!\#\).\)*$ "" " "

Arguments
100                desired length of line
^\(\(?\!\#\).\)*$  ignore lines with #    ^caret serves for several purposes
                                     #    here for negation
""                 prefix (none)
" "                where to split line

# 2 COMMENTS #' modifies only lines starting with #'\s (space) !!!
# doesn't modify code or code followed by #
perl wrapper.pl < long_lines.R 100 ^\#\'\\s \#\'\\s " "
100                desired length of line
^\#\'\\s           include lines starting with #'\s ^caret for line start
\#\'\\s            prefix #'\s
" "                where to split line

# 3 COMMENTS # modifies only lines starting with #\s !!!
# doesn't modify code or code followed by # or comments #' !!!
perl wrapper.pl < long_lines.R 100 ^\#\\s \#\\s ", "
100                desired length of line
^\#\\s             include lines starting with #\s ^caret for line start
\#\\s              prefix #\s
", "               where to split line

# 4 COMMENTS # modifies comments having #\s anywhere !!!
# doesn't modify code or code followed by #' !!!
perl wrapper.pl < long_lines.R 100 \#\\s \#\\s ", "
100                desired length of line
\#\\s              include lines with #\s
\#\\s              prefix #\s
", "               where to split line

Summary one after the other:
LENGTH=80
#                 INPUTFILE    length  filter            prefix  separator    output file
# CODE
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\#\).\)*$ ""      ", "       > results__1.R
# COMMENTS #'
perl wrapper.pl < results__1.R $LENGTH ^\#\'\\s          \#\'\\s " "        > results__2.R
# COMMENTS #
perl wrapper.pl < results__2.R $LENGTH \#\\s             \#\\s   " "        > results__3.R



Independent summary: (no output_file)
LENGTH=100
#                 INPUTFILE    length  filter            prefix  separator
# CODE
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\#\).\)*$ ""      ", "
# COMMENTS #'
perl wrapper.pl < long_lines.R $LENGTH ^\#\'\\s          \#\'\\s " "
# COMMENTS #
perl wrapper.pl < long_lines.R $LENGTH \#\\s             \#\\s   " "







