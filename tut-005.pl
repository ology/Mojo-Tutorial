#!/usr/bin/env perl
use strict;
use warnings;

use DBI;
use Data::Dumper::Compact 'ddc';

my $dbh = DBI->connect('DBI:SQLite:dbname=tut.db', '', '');

my $sql = 'DROP TABLE IF EXISTS names';
$dbh->do($sql);

$sql = 'CREATE TABLE names (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type TEXT)';
$dbh->do($sql);

$sql = 'INSERT INTO names (name, type) VALUES ("Heidi", "Model")';
$dbh->do($sql);

$sql = 'INSERT INTO names (name, type) VALUES ("Eddie", "Rockstar")';
$dbh->do($sql);

$sql = 'SELECT * FROM names';
my $names = $dbh->selectall_arrayref($sql);
warn 'NAMES: ', ddc($names); # [ [ id, name, type ], ... ]
