#!/usr/bin/env perl

use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render(
    template => 'index',
    message => 'Hello world!',
  );
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1><%= $message %></h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
