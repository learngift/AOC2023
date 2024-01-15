#! /usr/bin/perl

use strict;
my @l = `cat input6.txt`;
#my @l = `cat test6.txt`;
chomp @l;
my (undef, @ts) = split ' ', $l[0];
my (undef, @ds) = split ' ', $l[1];

my $total = 1;

foreach my $i (0..$#ts) {
    my $t = $ts[$i];
    my $d = $ds[$i];
    my $count = 0;
    foreach my $j (1..$t) {
        my $travel = $j * ($t - $j);
        if ($travel > $d) {
            $count++;
            print "$j:$travel ";
        }
    }
    die "bug $t $d" unless $count;
    $total *= $count;
    print " -> $count\n";
}
print "$total\n";
# 2374848
