#!/usr/bin/perl
my $numArgs = $#ARGV + 1;

$max_length = $ARGV[0];                   # 1st idx 0 = length of line

$ARGV[1] =~ s/\\s/ /g;
$ARGV[1] =~ s/^(?<!\\)\\^(?!\\)//g;
#$ARGV[1] =~ s/\\//g;
$line_filter_pattern = qr/$ARGV[1]/;      # 2nd idx 1 = filter_pattern, when to act

$ARGV[2] =~ s/\\s/ /g;
$ARGV[2] =~ s/\\//g;
$prefix_pattern = $ARGV[2];               # 3rd idx 2 = prefix_pattern, which prefix to add

$break_point = $ARGV[3];                  # 4rd idx 3 = character in which to break lines

$ARGV[4] =~ s/\\s/ /g;
$ARGV[4] =~ s/^(?<!\\)\\^(?!\\)//g;
#$ARGV[1] =~ s/\\//g;
$line_filter_pattern2 = qr/$ARGV[4]/;     # 5th idx 4 = filter_pattern, when to act


$linebreak_prefix = "\n$prefix_pattern";  # \n is linebreak
$li_pre_length = length($linebreak_prefix);
$max_length -= ($li_pre_length - 1);

foreach my $line ( <STDIN> ) {

# act in lines with prefix pattern if
  if ($line =~ /$line_filter_pattern.*?$/ and $line =~ /$line_filter_pattern2.*?$/) {
      $r2 = $line;
      $l_line = length($line);

#     Check if splitting is necessary/possible
      if ($line =~ /$break_point/) {
        $r2 =~ s/\G.{0,$max_length}($break_point|.$)\K/$linebreak_prefix/gsem;

        if(not($l_line == $max_length + $li_pre_length or length($r2) == $l_line + $li_pre_length) ) {
#         add breaks and prefixes in a loop way as r2 };
          $line = $r2;
          $line =~ s/$linebreak_prefix$//;
        }
      }
  }
  print $line;
}
