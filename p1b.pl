#!/usr/bin/perl 

# thanks to the reddit post that said "The right calibration values for string eighthree is 83..." https://www.reddit.com/r/adventofcode/

# perl -ane '$a = $_; chomp $a; $a =~ s/one/on1ne/g; $a =~ s/two/tw2wo/g; $a =~ s/three/thre3hree/g; $a =~ s/four/fou4our/g ; $a =~ s/five/fiv5ive/g ; $a =~ s/six/si6ix/g; $a =~ s/seven/seve7even/g; $a =~ s/eight/eigh8ight/g ; $a =~ s/nine/nin9ine/g ; $a =~ s/[a-z]//g; $a =~ m/(\d)\d*(\d)/; $b += 0 +  ((defined $2) ? "$1$2" : $a.$a); END{print $b}' < input1.txt
#exit 0

my %h = map {(qw(one two three four five six seven eight nine)[$_-1] => $_, $_ => $_)} 1..9;
my $s = join('|', keys %h);
my $b = 0;
open FILE, '<input1.txt';
while (my $a = <FILE>) {
      chomp $a;
      if ($a =~ m/($s).*($s)/) {
          $b += $h{$1} . $h{$2};
      } elsif ($a =~ m/($s)/) {
          $b += $h{$1} . $h{$1};
      }
}
print "$b\n";
# 53221
