use strict;

#open FILE, '<test8b.txt' or die $!;
open FILE, '<input8.txt' or die $!;
my @lines = <FILE>;
chomp @lines;
my @dirs = split '', shift @lines;
my %h;
my %state;
foreach my $line (@lines) {
    next if $line eq '';
    my ($key, $left, $right) = $line =~ m/(\w+) = .(\w+), (\w+)\)/;
    print "$key = ($left, $right)\n";
    die "bad $line" unless defined $right;
    $h{$key} = {L => $left, R => $right};
    $state{$key}++ if $key =~ m/A$/;
}

my $i = 0;
my $count = 0;
my $fini = 0;
while (! $fini) {
    my @astate = keys %state;
    print "$count: $#astate\($astate[0], $astate[1]) $dirs[$i]\n";
    my $dir = $dirs[$i++];
    $i = 0 if $i > $#dirs;
    my %new_state;
    $fini = 1;
    foreach my $key (keys %state) {
        my $v = $h{$key}->{$dir};
        $new_state{$v}++;
        $fini = 0 unless $v =~ m/Z$/;
    }
    %state = %new_state;
    $count++;
}
print "$count " . join (', ', sort keys %state) . "\n";
# 