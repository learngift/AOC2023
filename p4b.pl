#! /usr/bin/perl

use strict;

my @copies;

open FILE, '<input4.txt' or die $!;
my $total = 0;
while (my $line = <FILE>) {
    my $nb_copy = 1 + shift @copies;
    $total += $nb_copy;
    my ($l, $r) = $line =~ m/: ([0-9 ]+) \| ([0-9 ]+)/;
    my %win = map {($_ => 1)} (split ' ', $l);
    my @nb = grep {exists $win{$_}} (split ' ', $r);
    foreach my $i (0 .. $#nb) {
        $copies[$i] += $nb_copy;
    }
}
print "$total\n";
# 5095824
