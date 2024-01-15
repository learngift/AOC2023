use strict;

#open FILE, '<test8.txt' or die $!;
open FILE, '<input8.txt' or die $!;
my @lines = <FILE>;
chomp @lines;
my @dirs = split '', shift @lines;
my %h;
foreach my $line (@lines) {
    next if $line eq '';
    my ($key, $left, $right) = $line =~ m/([A-Z]+) = .([A-Z]+), ([A-Z]+)\)/;
    print "$key = ($left, $right)\n";
    die "bad $line" unless defined $right;
    $h{$key} = {L => $left, R => $right};
}

my $i = 0;
my $state = 'AAA';
my $count = 0;
while ($state ne 'ZZZ') {
    print "$count: $state $dirs[$i]\n";
    my $dir = $dirs[$i++];
    $i = 0 if $i > $#dirs;
    $state = $h{$state}->{$dir};
    $count++;
}
print "$count\n";
# 19199