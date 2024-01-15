#!/usr/bin/perl 

# perl -ane 's/[a-z]|\n//g; @d=split ""; $b += $d[0].$d[$#d]; END{print $b}' < input1.txt

my $b = 0;
open FILE, '<input1.txt';
while (my $a = <FILE>) {
      chomp $a;
      $a =~ s/[a-z]//g;
      my @d = split '', $a;
      $b += $d[0] . $d[$#d];
}
print "$b\n";
# 55834

