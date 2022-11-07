# Examples 1 to 5 explained

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

# 5 CODE # don't modify lines when "if" word present !!!
# and # present !!!
perl wrapper.pl < long_lines.R 100 ^^\(\(?\!\\bif\\b\).\)*$ "" ", " ^\(\(?\!\#\).\)*$
100                     desired length of line
^\(\(?\!\\bif\\b\).\)*$ dont modify line if word "if" is present, \\bWord\\b matches word
                        see above about caret ^
\#\\s                   prefix (none)
", "                    where to split line
^\(\(?\!\#\).\)*$       ignore lines with # hashtag


Some Concatenated examples - printing to file
LENGTH=80
#                 INPUTFILE    length  filter                   prefix  split_in  second_filter       output file
# 5 CODE # don't modify lines when "if" word present
# and # present !!!
perl wrapper.pl < long_lines.R $LENGTH ^^\(\(?\!\\bif\\b\).\)*$ ""      ", "      ^\(\(?\!\#\).\)*$  > results__1.R
# 2 COMMENTS #'
perl wrapper.pl < results__1.R $LENGTH ^\#\'\\s                 \#\'\\s " "                          > results__2.R
# 4 COMMENTS #
perl wrapper.pl < results__2.R $LENGTH \#\\s                    \#\\s   " "                          > final.R



Some examples - console
LENGTH=100
#                 INPUTFILE    length  filter                  prefix  split_in  second_filter
# 1 CODE
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\#\).\)*$       ""      ", "
# 2 COMMENTS #'
perl wrapper.pl < long_lines.R $LENGTH ^\#\'\\s                \#\'\\s " "
# 4 COMMENTS #
perl wrapper.pl < long_lines.R $LENGTH \#\\s                   \#\\s   " "
# 5 CODE # don't modify lines when "if" word present !!!
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\\bif\\b\).\)*$ ""      ", "      ^\(\(?\!\#\).\)*$







