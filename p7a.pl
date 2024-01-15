#!/usr/bin/perl
use strict;

open FILE, '<input7.txt' or die $!;
#open FILE, '<test7_bis.txt' or die $!;

my @hands;
while (my $line = <FILE>) {
    chomp $line;
    my ($hand, $bid) = split ' ', $line;
    my $vhand = $hand;
    $vhand =~ tr/23456789TJQKA/abcdefghijklm/;
    my %h;
    foreach my $v (split '', $vhand) {
        $h{$v}++;
    }
    my @counts = sort { $b <=> $a } (values %h); # decreasing
    my $value;
    if ($#counts == 0) {
        $value = 7; # 'Five of a kind';
    } elsif ($counts[0] == 4) {
        $value = 6; # 'Four of a kind';
    } elsif ($counts[0] == 3 && $counts[1] == 2) {
        $value = 5; # 'Full house';
    } elsif ($counts[0] == 3) {
        $value = 4; # 'Three of a kind';
    } elsif ($counts[1] == 2) {
        $value = 3; # 'Two pair';
    } elsif ($counts[0] == 2) {
        $value = 2; # 'One pair';
    } elsif (5 == scalar @counts) {
        $value = 1; # 'High card';
    } else {
        $value = 0;
    }
    push @hands, [$hand, $bid, $vhand, $value];
    print "$hand, $bid, $vhand, $value \n";
}
@hands = sort { ($a->[3] <=> $b->[3]) || ($a->[2] cmp $b->[2]) } @hands;

my $total = 0;
my $rank = 1;
foreach my $hand (@hands) {
    print "$rank: $hand->[0] \t $hand->[1] \t $hand->[2] \t $hand->[3] \n";
    $total += $hand->[1] * $rank++;
}
print "$total\n";

#251183179
#251287184
