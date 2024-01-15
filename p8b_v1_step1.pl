use strict;

#open FILE, '<test8b.txt' or die $!;
open FILE, '<input8.txt' or die $!;
my @lines = <FILE>;
chomp @lines;
my @dirs = split '', shift @lines;
my %h;
my @starts;
foreach my $line (@lines) {
    next if $line eq '';
    my ($key, $left, $right) = $line =~ m/(\w+) = .(\w+), (\w+)\)/;
    print "$key = ($left, $right)\n";
    die "bad $line" unless defined $right;
    $h{$key} = {L => $left, R => $right};
    push @starts, $key if $key =~ m/A$/;
}

my $i = 0;
my $pcount = 0;
my $count = 0;
my $fini = 0;
my $state = $starts[0];
while (! $fini) {
    my $dir = $dirs[$i++];
    $i = 0 if $i > $#dirs;
    $state = $h{$state}->{$dir};
    if ($state =~ m/Z$/) {
        my $delta = $count - $pcount;
        print "$count $delta $i $state\n" ;
        $pcount = $count;
    }
    $count++;
}
print "$count \n" ;
# 13938 + 13939 * n