#!/usr/bin/env perl
use strict;
use warnings;

use Data::Dumper::Compact 'ddc';

my $x; # Declare a variable to use

# Scalar
$x = 'Heidi';         # Assign to the variable
print '1. ', ddc($x); # Print out the variable
print "\n";           # Print a blank line

# Array
$x = ['Heidi', 'Eddie'];
print '2. ', ddc($x);
print "\n";

# Hash
$x = { 'Heidi' => 'Model', 'Eddie' => 'Rockstar' };
print '3. ', ddc($x), "\n";

# Array of hashes
$x = [
    { name => 'Heidi', type => 'Model' },
    { name => 'Eddie', type => 'Rockstar' },
];
print '4. ', ddc($x);
