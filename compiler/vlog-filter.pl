#!/usr/bin/env perl
use warnings;
use strict;
use feature qw(say);

my $join =0;
while (my $line=<>)
{
    if ($line=~/(?:^Error|Warning)-\[(.*)\]/)
    {
        next if ($1=~/(LIB-NO-EXT|UNKWN_IGOPTS)/); #ignore these warnings
        $join =1;
        print $line;
    }
    elsif($line=~/^$/)
    {
        $join=0;
    }
    elsif ($join)
    {
        print $line;
    }
}
