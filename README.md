# mix-deps-json

This is a minimal elixir proxy that accepts a mix.exs file as a POST body, and spits out the project dependencies as JSON for [Libraries.io](https://libraries.io).

Processed requests return a status code of 200 and JSON body, failed requests will return 422 and ":(" as the body.

## Development

Source hosted at [GitHub](http://github.com/librariesio/mix-deps-json).
Report issues/feature requests on [GitHub Issues](http://github.com/librariesio/mix-deps-json/issues). Follow us on Twitter [@librariesio](https://twitter.com/librariesio). We also hangout on [Gitter](https://gitter.im/librariesio/support).

### Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Add tests for it. This is important so I don't break it in a
   future version unintentionally.
 * Add documentation if necessary.
 * Commit, do not change procfile, version, or history.
 * Send a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2016 Andrew Nesbitt. See [LICENSE](https://github.com/librariesio/mix-deps-json/blob/master/LICENSE) for details.
