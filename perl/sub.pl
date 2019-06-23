#!/usr/bin/perl
use strict

sub max {
    my ($max_so_far) = shift @_;

    foreach (@_) {
        if ($_ > $max_so_far) {
            $max_so_far = $_;
        }
    }

    $max_so_far;
}

$maximum = &max(3, 5, 10, 6, 4);


my @names = qw( hello darling I love you);
my $result = &which_is("I", @names);

sub which_is {
    my ($what, @list) = @_;
    foreach (0..$#list) {
        if ($what eq $list[$_]) {
            return $_;
        }
    }

    return -1;
}
