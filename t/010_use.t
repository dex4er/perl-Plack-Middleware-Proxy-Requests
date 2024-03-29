#!/usr/bin/perl

use strict;
use warnings;

use Carp ();

local $SIG{__WARN__} = sub { local $Carp::CarpLevel = 1; Carp::confess("Warning: ", @_) };

use Test::More tests => 1;

BEGIN { use_ok 'Plack::Middleware::Proxy::Requests' }
