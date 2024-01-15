#! /usr/bin/perl

use strict;

open FILE, '<input4.txt' or die $!;
my $total = 0;
while (my $line = <FILE>) {
    my ($l, $r) = $line =~ m/: ([0-9 ]+) \| ([0-9 ]+)/;
    my %win = map {($_ => 1)} (split ' ', $l);
    my @nb = grep {exists $win{$_}} (split ' ', $r);
    $total += 2 ** $#nb if scalar @nb;
    print "$l : " . join(', ', @nb) . "\n";
}
print "$total\n";
# 22897
