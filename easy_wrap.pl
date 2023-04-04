#!/usr/bin/perl
my $numArgs = $#ARGV + 1;
$max_length_o = $ARGV[0];                   # 1st idx 0 = length of line
$hashtag = "\#";
$hashtag_break_point = " ";
foreach my $line ( <STDIN> ) {
  ($prefix, $text) = ($line =~ /^([\s\x27$hashtag]+)?(.*)/);
  $linebreak_prefix = "\n$prefix";  # \n is linebreak
  $break_point = ", ";
  $max_length = $max_length_o;
  $r2 = $line;
  $l_line = length($line);
  $check = 0;

  # check whether it is a comment or code, by the presence of hashtag in $prefix
  # $check serves acts as a boolean to see if wrapper should act
  # check if breakpoint is present and if "if" is present and { absent
  if ($prefix =~ /$hashtag/) {
    $break_point = $hashtag_break_point;
    if ($line =~ /$break_point/ and not($line =~ /\bif\b/ and $line !~ "{")) {
      $check = 1;
    }
  } else {
    # in addition to the above explanation this checks that hashtag is absent
    if ($line =~ /$break_point/ and $line !~ /#/ and not($line =~ /\bif\b/ and $line !~ "{")) {
      $check = 1;
      # check if the line has the function string, to indent
      if ($line =~ "function\\(") {
        ($fun_prefix, $text2) = ($line =~ /(.*?<- function)(.*)/);
        $fun_prefix_length = length($fun_prefix) + 1;
        $spaces = " " x $fun_prefix_length;
        $linebreak_prefix = "\n$prefix$spaces";  # \n is linebreak
      }
    }
  }
  $li_pre_length = length($linebreak_prefix);
  $max_length -= ($li_pre_length - 1);
  # check $check boolean and do changes
  if ($check =~ 1) {
    $r2 =~ s/\G.{0,$max_length}($break_point|.$)\K/$linebreak_prefix/gsem;
    $l_r2 = length($r2);
    if(not($l_line == $max_length + $li_pre_length or $l_r2 == $l_line + $li_pre_length) and 
      $l_line > $max_length_o) {
      $line = $r2;
      $line =~ s/$linebreak_prefix$//;
    }
  }
  print $line;
}
