iris %>%
  group_by(Species) %>%
  summarise(Sepal.Length = mean(Sepal.Length), Sepal.Width = mean(Sepal.Width), Species = n_distinct(Species))

#' short comment, do nothing starting in #'
#' long starting with #'  line  big chunk, line  big chunk HERE line  big chunk line  big chunk line long starting, with #' long starting with #'

#' ruler10_234567_20_234567_30_234567_40_234567_50_234567_60_234567_70_234567_80_234567_90_23456_100
#'
#' short comment, previous line do nothing

# only comments starting #
# long comments starting with # comments only comments only comments only comments only, HERE comments only comments only comments only comments only comments
# BIG comment line no commas line  BIG comment line no commas line  BIG comment line no commas line  BIG comment line no commas line  BIG comment line no commas line

code(arg1, arg2) # code and then comments then comments then comments then comments then, comments then comments then comments then comments

BIG no commas line BIG no commas line BIG no commas line BIG no commas line BIG no commas line BIG no commas line BIG no commas line
#' BIG comment line no commas line  BIG comment line no commas line  BIG comment line no commas line  BIG comment line no commas line  BIG comment line no commas line
BIG no commas line BIG no commas line BIG no commas line BIG no commas line BIG no commas line BIG no commas line BIG no commas line
