#! /usr/bin/perl

use strict;

open F, '<input5.txt' or die $!;
my $seeds = <F>;
chomp $seeds;
my (undef, @seeds) = split ' ', $seeds;

my %h;
my %a;
my ($from, $to);
while (my $line = <F>) {
    chomp $line;
    next if $line eq '';
    if ($line =~ m/(.*)-to-(.*) map:/) {
        $h{$1} = $2;
        $from = $1;
        $to = $2;
    } else {
        my ($dest_start, $source_start, $length) = split ' ', $line;
        push @{$a{$from}}, [$source_start, $length, $dest_start];
    }
}

my $min_loc = 999999999;

foreach my $seed (@seeds) {
    my $state = 'seed';
    my $num = $seed;
    print "Seed $seed\n";
    while ($state ne 'location') {
        my $newnum = $num;
        foreach my $tuple (@{$a{$state}}) {
            my ($start, $length, $dstart) = @$tuple;
            $newnum = $num + $dstart - $start if $num >= $start && $num < $start + $length;
        }
        $num = $newnum;
        #print "$seed $state -> $h{$state} $num -> $newnum \n";
        $state = $h{$state};
    }
    print "$seed -> $num $state\n\n";
    $min_loc = $num if $num < $min_loc;
}
print "$min_loc\n";
#196167384
