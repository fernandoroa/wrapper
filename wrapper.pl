#!/usr/bin/perl
my $numArgs = $#ARGV + 1;

$max_length = $ARGV[0];                   q{ 1st idx 0 = length };

$ARGV[1] =~ s/\\s/ /g;
$ARGV[1] =~ s/\\//g;
$line_filter_pattern = qr/$ARGV[1]/;      q{ 2nd idx 1 = filter_pattern, when to act };

$ARGV[2] =~ s/\\s/ /g;
$ARGV[2] =~ s/\\//g;
$prefix_pattern = $ARGV[2];               q{ 3rd idx 2 = prefix_pattern, which prefix to add };

$break_point = $ARGV[3];                  q{ 4rd idx 3 = character in which to break lines };


$linebreak_prefix = "\n$prefix_pattern";  q{ \n is linebreak };
$li_pre_length = length($linebreak_prefix);
$max_length -= ($li_pre_length - 1);

foreach my $line ( <STDIN> ) {

q{act in lines with prefix pattern if else };
  if ($line =~ /$line_filter_pattern.*?$/) {
      ($r2 = $r = $line);

q{    check if splitting is necessary if else };
      $r2 =~ s/\G.{0,$max_length}($break_point|.$)\K/$linebreak_prefix/gsem;
      if(length($r) != $max_length + $li_pre_length and length($r2) != length($r) + $li_pre_length ) {

q{      add breaks and prefixes in a loop way };
        $r = $r2;
        $r =~ s/$linebreak_prefix$//;
        print $r;
      } else {
        print $line;
      }
  } else {
    print $line;
  }
}
