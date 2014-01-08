#!/usr/bin/env perl

use Mojo::Base -strict;
use Net::Salesforce;
use Net::Salesforce::Client;
use DDP;

my $sf = Net::Salesforce->new(key => $ENV{SFKEY}, secret => $ENV{SFSECRET});
$sf->authenticate;
$sf->refresh;

my $c = Net::Salesforce::Client->new(access_token => $ENV{SFACCESS_TOKEN});

p $c->sobjects;

my $case =
  $c->model('Case')->by_case_number('500i00000014iP0');

p $case->{case};
