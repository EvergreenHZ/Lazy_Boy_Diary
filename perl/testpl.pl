#! /usr/bin/perl

#$array[0] = "Hello";
#$array[1] = "World";
#$array[2] = $array[0] . " " . $array[1];
#$array[3] = "\n";
#
#@list = qw( I love you);
#
#foreach $x (@array) {
#    print $x;
#}
#
#foreach (@list) {
#    print ;
#}
#
#print "\n";
##
##
#@iter = (1..($#array));
#print $#array . "\n";
#print @iter . "\n";
#
#foreach $_ (@iter) {
#    print pop(@iter)
#}
#
#print "\n";

sub max {

    print @_;
    print "\n";
    print $#_;

    #$_[$#_ + 1] = 0;
    #$_[-1] = 0;  # wrong read only

    #foreach (@_) {
    #    if ($_[-1] < $_) {
    #        $_[-1] = $_;
    #        print $_[-1];
    #    }
    #}
    ##print "\n";
    #$_[-1];
}

print max(1, 2, 3, 4, 0, 9, 7)
