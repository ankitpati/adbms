#!/usr/bin/env perl

# apriori.pl
# Date  : 19 March 2016
# Author: Ankit Pati

use strict;
use warnings;

use Data::Dumper;

use Algorithm::Combinatorics 'subsets';

my (@l, @txns);

# Helper Subroutines
sub uniq { keys %{{ map { $_ => 1 } @_ }} }
sub issubset { my %h; undef @h{@{(shift)}}; delete @h{@{(shift)}}; !%h }

sub getcount {
    my $count = 0;

    foreach (@txns) {
        ++$count if issubset \@_, \@$_;
    }

    return $count;
}
# end of Helper Subroutines

print "Minimum Support?\n";
chomp (my $minsup = <>);
print "\n";

print <<'EOF';
Enter one transaction per line;
separate items with spaces.

EOF

$l[0] = {};

# Input Section
while (<>) {
    chomp;
    $_ = lc;

    my @uniq_items = uniq map ucfirst, split;
    @uniq_items = sort @uniq_items;

    my @txn_items;
    foreach (@uniq_items) {
        push @txn_items, $_;
        $l[0]->{$_} ||= 0;
        ++$l[0]{$_};
    }

    push @txns, \@txn_items if @txn_items;
}
# end of Input Section

# A-priori Logic
for (my $i = 0; $l[$i]; ++$i) {
    while (my ($key, $val) = each %{$l[$i]}) {
        delete $l[$i]->{$key} if $val < $minsup;
    }

    my @colls = sort keys %{$l[$i]};     # collections of items

    foreach my $coll1 (@colls) {
        my @items1 = split ',', $coll1;

        foreach my $coll2 (@colls) {
            my @items2 = split ',', $coll2;

            my $j;
            for ($j = 0; $j < @items1 - 1; ++$j) {
                last if $items1[$j] ne $items2[$j];
            }

            if ($j == @items1 - 1) {
                my @candidates = uniq @items1, $items2[$#items2];

                next if @candidates == @items1;
                @candidates = sort @candidates;

                foreach my $subset (subsets \@candidates, @candidates - 1) {
                    $l[$i + 1]->{join ',', @candidates} = getcount @candidates
                        if (exists $l[$i]->{join ',', sort @$subset});
                }
            }
        }
    }
}
# end of A-priori Logic

# Output Section
print "\n";

my $li = 1;
foreach my $ltable (@l) {
    print "Table L$li\n";

    foreach (sort keys %$ltable) {
        my $display_key = join ', ', split ',';
        print "$display_key => $ltable->{$_}\n";
    }
    print "\n";

    ++$li;
}
# end of Output Section

# end of apriori.pl

__END__
OUTPUT

Minimum Support?
2

Enter one transaction per line;
separate items with spaces.

1 3 4
2 3 5
1 2 3 5
2 5

Table L1
1 => 2
2 => 3
3 => 3
5 => 3

Table L2
1, 3 => 2
2, 3 => 2
2, 5 => 3
3, 5 => 2

Table L3
2, 3, 5 => 2
