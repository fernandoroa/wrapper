### Perl Wrapper

##### Some Concatenated examples - printing to file:

```
LENGTH=80
#                 INPUTFILE    length  filter                   prefix  split second_filter        output file
# 5 CODE # don't modify lines when "if" word present
# and # present !!!
perl wrapper.pl < long_lines.R $LENGTH ^^\(\(?\!\\bif\\b\).\)*$ ""      ", "  ^\(\(?\!\#\).\)*$  > results__1.R

# 2 COMMENTS #'
perl wrapper.pl < results__1.R $LENGTH ^\#\'\\s                 \#\'\\s " "                      > results__2.R

# 4 COMMENTS #
perl wrapper.pl < results__2.R $LENGTH \#\\s                    \#\\s   " "                      > final.R
```
<br>  

##### Some examples - console
```
LENGTH=100
#                 INPUTFILE    length  filter                  prefix  split  second_filter
# 1 CODE
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\#\).\)*$       ""      ", "

# 2 COMMENTS #'
perl wrapper.pl < long_lines.R $LENGTH ^\#\'\\s                \#\'\\s " "

# 4 COMMENTS #
perl wrapper.pl < long_lines.R $LENGTH \#\\s                   \#\\s   " "

# 5 CODE # don't modify lines when "if" word present !!!
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\\bif\\b\).\)*$ ""      ", "   ^\(\(?\!\#\).\)*$
```

Numbers corresponds to examples in summary.sh
