---
title: "Wrapper"
author: "Fernando Roa"
date: "November, 2022"
output: 
  html_document:
    keep_md: yes
---

<style type="text/css">
pre{
  font-size: 10px;
}
</style>

#### Easy wrapper

- Characteristics of easy wrap
- splits comment lines in space
- splits code lines in comma
- ignore lines with "if" when "{" absent

```
# Run in bash
perl easy_wrap.pl < long_lines.R 100 > long_lines_easy_wrap.R
# long_lines.R           input
# 100                    desired length of line
# long_lines_easy_wrap.R output
```
<br>  

#### Some Concatenated examples - printing to file:

```
LENGTH=80
#                 INPUTFILE    length  filter                   prefix  split_in  second_filter       output file
# 5 CODE # don't modify lines when "if" word present
# and # present !!!
perl wrapper.pl < long_lines.R $LENGTH ^^\(\(?\!\\bif\\b\).\)*$ ""      ", "      ^\(\(?\!\#\).\)*$  > results__1.R

# 2 COMMENTS #'
perl wrapper.pl < results__1.R $LENGTH ^\#\'\\s                 \#\'\\s " "                          > results__2.R

# 4 COMMENTS #
perl wrapper.pl < results__2.R $LENGTH \#\\s                    \#\\s   " "                          > final.R
```
<br>  

#### Some examples - console
```
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
```

Numbers corresponds to examples in summary.sh
