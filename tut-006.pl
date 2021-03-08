#!/usr/bin/env perl

use Mojolicious::Lite;
use DBI;
use Data::Dumper::Compact 'ddc';

get '/' => sub {
  my $c = shift;

  my $dbh = DBI->connect('DBI:SQLite:dbname=tut.db', '', '');

  my $sql = 'SELECT * FROM names';
  my $names = $dbh->selectall_arrayref($sql);
  warn 'NAMES: ', ddc($names); # [ [ id, name, type ], ... ]

  $c->render(
    text => "Hello $names->[0][1]!",
  );
};

app->start;
