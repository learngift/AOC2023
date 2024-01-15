#! /usr/bin/perl

use strict;
open FILE, '<input2.txt';

my $total = 0;
while (my $line = <FILE>) {
    chomp $line;
    my ($id, $data) = $line =~ m/Game (\d+): (.*)/;
    die "error $line" unless defined $line;
    my @datas = split ';', $data;
    die "error datas $data" unless scalar @datas;
    my $possible = 1;
    foreach my $grab (@datas) {
        my %h = ();
        foreach my $numcol (split ',', $grab) {
            my ($num, $color) = $numcol =~ m/(\d+)\s*(blue|red|green)/;
            die "error $line -> $numcol" unless defined $color;
            $h{$color} = $num;
        }
        if ($h{red} <= 12 && $h{green} <= 13 && $h{blue} <= 14) {
            # $total += $id;
        } else {
            $possible = 0;
        }
    }
    $total += $id if $possible;
}
print "$total\n";
# 1867 (1er essai)