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
  my $alert = $c->param('alert') || 'Zoinks!';
  $c->render(
    template => 'zoinks',
    message => 'Zoinks!',
    alert => $alert,
  );
} => 'zoinks';

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
<form method="get">
  <label for="alert">Alert:</label>
  <input type="text id="alert" name="alert"/>
  <input type="submit" name="submit" value="Submit"/>
</form>
<p></p>
<a href="<%= url_for('index') %>">Go back home...</a>
<script>
  alert('<%= $alert %>');
</script>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
