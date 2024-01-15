#! /usr/bin/perl

use strict;
use List::Util qw(max);

open FILE, '<input2.txt';

my $total = 0;
while (my $line = <FILE>) {
    chomp $line;
    my ($id, $data) = $line =~ m/Game (\d+): (.*)/;
    die "error $line" unless defined $line;
    my @datas = split ';', $data;
    die "error datas $data" unless scalar @datas;
    my %h = ();
    foreach my $grab (@datas) {
        foreach my $numcol (split ',', $grab) {
            my ($num, $color) = $numcol =~ m/(\d+)\s*(blue|red|green)/;
            die "error $line -> $numcol" unless defined $color;
            if (exists $h{$color}) {
                $h{$color} = max($num, $h{$color});
            } else {
                $h{$color} = $num;
            }
        }
    }
    $total += $h{red} * $h{green} * $h{blue};
}
print "$total\n";
# 84538 (1er essai)