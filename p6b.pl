#! /usr/bin/perl

use strict;
use POSIX;

my $t = 71530;
my $d = 940200;
my $count = 0;
foreach my $j (1..$t) {
    my $travel = $j * ($t - $j);
    if ($travel > $d) {
        $count++;
        print "$j:$travel ";
    }
}
print " -> $count\n";

$t = 55999793;
$d = 401148522741405;

my $delta = sqrt($t*$t - 4 * $d);
my $x1 = ($t-$delta) / 2.0;
my $x2 = ($t+$delta) / 2.0;
print "x1 = $x1, x2 = $x2\n";
$x1 = ceil($x1);
$x2 = floor($x2);
my $dx = 1 + $x2 - $x1;
print "x1 = $x1, x2 = $x2, x2-x1+1 = $dx\n";

# 39132886
