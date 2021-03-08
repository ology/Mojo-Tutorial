#!/usr/bin/env perl

use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render(
    template => 'index',
    message => 'Hello world!',
  );
} => 'index';

get '/zoinks' => sub {
  my $c = shift;
  $c->render(
    template => 'zoinks',
    message => 'Zoinks!',
  );
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1><%= $message %></h1>
<a href="<%= url_for('zoinks') %>">Zoinks!</a>

@@ zoinks.html.ep
% layout 'default';
% title 'Zoinks!';
<h1><%= $message %></h1>
<a href="<%= url_for('index') %>">Go back home...</a>
<script>
  alert('Zoinks!');
</script>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head>
    <title><%= title %></title>
    <style rel="stylesheet" type="text/css">
      body {                                                                                                                                                                       
        font-family: Arial, Helvetica, sans-serif;
      }
    </style>
  </head>
  <body><%= content %></body>
</html>
