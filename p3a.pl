#!/usr/bin/perl

use strict;

open FILE, '<input3.txt' or die "Can't open input $!";
#open FILE, '<test3.txt' or die "Can't open input $!";
my @lines = <FILE>;
chomp @lines;
my @a;
#my %syms; # all symbols
foreach my $line (@lines) {
    my @l = split '', $line;
    #print '' . join('', @l)."\n";
    push @a, [@l];
    #my $line2 = $line;
    #$line2 =~ s/[0-9\.]//g;
    #foreach my $s (split '', $line2) {
    #    $syms{$s}++;
    #}
}

my $sym = '$/=%#*+-&@'; 

my $sum = 0;

foreach my $y (0..$#a) {
    print "<div>";
    my $x = 0;
    my @l = @{$a[$y]};
    while ($x <= $#l) {
        if ($l[$x] =~ m/[0-9]/) {
            my $len = 1;
            $len++ while $l[$x + $len] =~ m/[0-9]/;
            my $num = substr($lines[$y], $x, $len);
            # print " $num";
            my $is_part = 0;
            foreach my $dx (($x-1) .. ($x+$len)) {
                next if $dx < 0;
                for my $dy (($y-1) .. ($y+1)) {
                    next if $dy < 0;
                    next if $dy > $#a;
                    if ($is_part == 0 && index($sym, $a[$dy]->[$dx]) != -1 && $dx <= $#l) { # j'ai galéré à ajouter cette dernière condition
                        $is_part = 1;
                        print " $num" . $a[$dy]->[$dx];
                        $sum += $num;
                    }
                }
            }
            if ($is_part) {
                #print "<span class=\"bold\">$num</span>";
            } else {
                #print $num;
            }
            $x += $len;
        } else {
            #print $l[$x];
            $x++;
        }
    }
    print "</div>\n";
}
print "$sum\n";

#535946 2162
# 533784 https://mutraction.dev/sandbox/?view=preview#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
