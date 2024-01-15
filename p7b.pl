#!/usr/bin/perl
use strict;

open FILE, '<input7.txt' or die $!;
#open FILE, '<test7_bis.txt' or die $!; # https://www.reddit.com/r/adventofcode/comments/18cr4xr/2023_day_7_better_example_input_not_a_spoiler/
#open FILE, '<test7.txt' or die $!;

my @hands;
while (my $line = <FILE>) {
    chomp $line;
    my ($hand, $bid) = split ' ', $line;
    my $vhand = $hand;
    $vhand =~ tr/J23456789TQKA/abcdefghijklm/;
    my %h;
    foreach my $v (split '', $vhand) {
        $h{$v}++;
    }
    my $nbj = $h{'a'}; delete $h{'a'};
    my @counts = sort { $b <=> $a } (values %h); # decreasing
    my $value;
    if ($#counts == 0) {
        $value = 7; # 'Five of a kind';
    } elsif ($counts[0] == 4) {
        $value = $nbj ? 7 : 6; # 'Four of a kind';
    } elsif ($counts[0] == 3 && $counts[1] == 2) {
        $value = 5; # 'Full house';
    } elsif ($counts[0] == 3) {
        $value = $nbj ? (5+$nbj) : 4; # 'Three of a kind';
    } elsif ($counts[1] == 2) {
        $value = $nbj ? 5 : 3; # 'Two pair';
    } elsif ($counts[0] == 2) {
        if ($nbj == 1) {
            $value = 4;
        } else {
            $value = $nbj ? $nbj+4 : 2; # 'One pair';
        }
    } elsif ($nbj) {
        $value = (2, 4, 6, 7, 7)[$nbj-1];
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

#250757288
