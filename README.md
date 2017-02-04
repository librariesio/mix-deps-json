# mix-deps-json

[![Build Status](https://travis-ci.org/librariesio/mix-deps-json.svg?branch=master)](https://travis-ci.org/librariesio/mix-deps-json)
[![Inline docs](http://inch-ci.org/github/librariesio/mix-deps-json.svg?branch=master)](http://inch-ci.org/github/librariesio/mix-deps-json)
[![license](https://img.shields.io/github/license/librariesio/mix-deps-json.svg)](https://github.com/librariesio/mix-deps-json/blob/master/LICENSE.txt)
[![Docker Automated build](https://img.shields.io/docker/automated/librariesio/mix-deps-json.svg)](https://hub.docker.com/r/librariesio/mix-deps-json/)

This is a minimal elixir proxy that accepts a mix.exs file as a POST body, and spits out the project dependencies as JSON for [Libraries.io](https://libraries.io).

Processed requests return a status code of 200 and JSON body, failed requests will return 422 and ":(" as the body.

## Docker

You can use Docker to run mix-deps-json

First, install Docker. If you've got run macOS or Windows, Docker for Mac/Windows makes this really easy.

If you have Windows Home Edition, you'll need to download and run Docker Toolbox.
Then, run:

    docker run -t -e PORT=5000 -p 5000:5000 mix-deps-json

mix-deps-json will be running on http://localhost:5000.

Note: You can add PORT to a .env file instead of supplying them directly on the command-line.

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
