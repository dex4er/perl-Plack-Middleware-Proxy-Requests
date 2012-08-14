#!/usr/bin/perl -c

# plackup -s Twiggy -E Proxy -e 'enable q{AccessLog}' proxy.psgi

use lib '../lib', 'lib';

use Plack::Builder;
use Plack::App::Proxy;

builder {
    enable 'Proxy::Connect';
    enable 'Proxy::AddVia';
    enable 'Proxy::Requests';
    Plack::App::Proxy->new->to_app;
};
