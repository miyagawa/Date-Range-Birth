use strict;
use Test::More tests => 8;

use Date::Simple;
use Date::Range::Birth;

{
    my $date  = Date::Simple->new(2000, 11, 11);
    my $range = Date::Range::Birth->new(20, $date);
    is $range->start->format("%Y %m %d"), "1979 11 12", 'start';
    is $range->end->format("%Y %m %d"), "1980 11 11", 'start';
}

{
    my $date  = Date::Simple->new(2001, 12, 8);
    my $range = Date::Range::Birth->new([24, 25], $date);
    is $range->start->format("%Y %m %d"), "1975 12 09";
    is $range->end->format("%Y %m %d"), "1977 12 08";
}

{
    my $date  = Date::Simple->new(2001, 12, 8);
    my $range = Date::Range::Birth->new(50, $date);
    is $range->start->format("%Y %m %d"), "1950 12 09";
    is $range->end->format("%Y %m %d"), "1951 12 08";
}

{
    my $date  = Date::Simple->new(2001, 12, 8);
    my $range = Date::Range::Birth->new([50, 60], $date);
    is $range->start->format("%Y %m %d"), "1940 12 09";
    is $range->end->format("%Y %m %d"), "1951 12 08";
}

