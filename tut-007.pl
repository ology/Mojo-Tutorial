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
    template => 'index',
    message => 'Hello!',
    names => $names,
  );
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1><%= $message %></h1>
% for my $name (@$names) {
<p><%= $name->[1] %> is a <%= $name->[2] %></p>
% }

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
