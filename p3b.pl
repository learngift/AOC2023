#!/usr/bin/perl

use strict;

open FILE, '<input3.txt' or die "Can't open input $!";
my @lines = <FILE>;
my @a = map { chomp; [ split '' ] } @lines;

my %stars; # map star location to the numbers that touch it

foreach my $y (0..$#a) {
    my @l = @{$a[$y]};
    my $x = 0;
    while ($x <= $#l) {
        if ($l[$x] =~ m/[0-9]/) {
            my $len = 1;
            $len++ while $l[$x + $len] =~ m/[0-9]/;
            my $num = substr($lines[$y], $x, $len);
            LABEL: foreach my $dx (($x-1) .. ($x+$len)) {
                next if $dx < 0 || $dx > $#l;
                for my $dy (($y-1) .. ($y+1)) {
                    next if $dy < 0 || $dy > $#a;
                    if ($a[$dy]->[$dx] eq '*') {
                        push @{$stars{"$dx - $dy"}}, $num;
                        next LABEL;
                    }
                }
            }
            $x += $len;
        } else {
            $x++;
        }
    }
}

my $sum = 0;
foreach my $v (values %stars) {
    my @aa = @$v;
    # print '', join (', ', @aa), "\n";
    next unless scalar @aa == 2;
    $sum += $aa[0] * $aa[1];
}
print "$sum\n";
# 78826761
