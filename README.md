# wrapper

##### Summary one after the other:

```
LENGTH=80
#                 INPUTFILE    length  filter            prefix  separator    output file
# CODE
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\#\).\)*$ ""      ", "       > results__1.R
# COMMENTS #'
perl wrapper.pl < results__1.R $LENGTH ^\#\'\\s          \#\'\\s " "        > results__2.R
# COMMENTS #
perl wrapper.pl < results__2.R $LENGTH \#\\s             \#\\s   " "        > results__3.R
```
<br>  
<br>

##### Independent summary: (no output_file)
```
LENGTH=100
#                 INPUTFILE    length  filter            prefix  separator
# CODE
perl wrapper.pl < long_lines.R $LENGTH ^\(\(?\!\#\).\)*$ ""      ", "
# COMMENTS #'
perl wrapper.pl < long_lines.R $LENGTH ^\#\'\\s          \#\'\\s " "
# COMMENTS #
perl wrapper.pl < long_lines.R $LENGTH \#\\s             \#\\s   " "
```
