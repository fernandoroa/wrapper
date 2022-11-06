iris %>%
  group_by(Species) %>%
  summarise(Sepal.Length = mean(Sepal.Length), Sepal.Width = mean(Sepal.Width), Species = n_distinct(Species))

#' short comment, do nothing starting in #'
#' long starting in #'  line to split big chunk line to split big chunk, HERE line to split big chunk line to split big chunk line to split

#' ruler10_234567_20_234567_30_234567_40_234567_50_234567_60_234567_70_234567_80_234567_90_23456_100
#'
#' short comment, previous line do nothing

# only comments starting #
# long comments starting # comments only comments only comments only comments only, HERE comments only comments only comments only comments only comments

code(arg1, arg2) # code and then comments then comments then comments then comments then, comments then comments then commentsthen comments
