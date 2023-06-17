# Plack::Middleware::Proxy::Requests

[![CI](https://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests/actions/workflows/ci.yaml/badge.svg)](https://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests/actions/workflows/ci.yaml)
[![Trunk Check](https://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests/actions/workflows/trunk.yaml/badge.svg)](https://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests/actions/workflows/trunk.yaml)
[![CPAN](https://img.shields.io/cpan/v/Plack-Middleware-Proxy-Requests)](https://metacpan.org/dist/Plack-Middleware-Proxy-Requests)


## NAME

Plack::Middleware::Proxy::Requests - Forward proxy server

## SYNOPSIS

```perl

    # In app.psgi
    use Plack::Builder;
    use Plack::App::Proxy;

    builder {
        enable "Proxy::Connect";
        enable "Proxy::AddVia";
        enable "Proxy::Requests";
        Plack::App::Proxy->new->to_app;
    };

```

```sh

    # From shell
    plackup -s Twiggy -E Proxy -e 'enable q{AccessLog}' app.psgi

    # or
    twiggy -MPlack::App::Proxy \
            -e 'enable q{AccessLog}; enable q{Proxy::Connect}; \
                enable q{Proxy::AddVia}; enable q{Proxy::Requests}; \
                Plack::App::Proxy->new->to_app'

```

## DESCRIPTION

This module handles HTTP requests as a forward proxy server.

Its job is to set a `plack.proxy.url` environment variable based on
`REQUEST_URI` variable.

The HTTP responses from the Internet might be invalid. In that case it
is required to run the server without [Plack::Middleware::Lint](https://metacpan.org/pod/Plack%3A%3AMiddleware%3A%3ALint) module.
This module is started by default and disabled if `-E` or
`--no-default-middleware` option is used when starting [plackup](https://metacpan.org/pod/plackup)
script. Note that this disables also [Plack::Middleware::AccessLog](https://metacpan.org/pod/Plack%3A%3AMiddleware%3A%3AAccessLog) so
it has to be enabled explicitly if needed.

The default server [Plack::Server::PSGI](https://metacpan.org/pod/Plack%3A%3AServer%3A%3APSGI) alias `Standalone` can hang
up on the stalled connection. It is better to run a proxy server with
[Starlet](https://metacpan.org/pod/Starlet), [Starman](https://metacpan.org/pod/Starman) or [Twiggy](https://metacpan.org/pod/Twiggy).

## SEE ALSO

[Plack](https://metacpan.org/pod/Plack), [Plack::App::Proxy](https://metacpan.org/pod/Plack%3A%3AApp%3A%3AProxy), [Plack::Middleware::Proxy::Connect](https://metacpan.org/pod/Plack%3A%3AMiddleware%3A%3AProxy%3A%3AConnect),
[Plack::Middleware::Proxy::AddVia](https://metacpan.org/pod/Plack%3A%3AMiddleware%3A%3AProxy%3A%3AAddVia), [Starlet](https://metacpan.org/pod/Starlet), [Starman](https://metacpan.org/pod/Starman), [Twiggy](https://metacpan.org/pod/Twiggy).

## BUGS

If you find the bug or want to implement new features, please report it at
[https://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests/issues](https://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests/issues)

The code repository is available at
[http://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests](http://github.com/dex4er/perl-Plack-Middleware-Proxy-Requests)

## AUTHOR

Piotr Roszatycki <dexter@cpan.org>

## LICENSE

Copyright (c) 2012-2013, 2023 Piotr Roszatycki <dexter@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

See [http://dev.perl.org/licenses/artistic.html](http://dev.perl.org/licenses/artistic.html)
