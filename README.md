mix-deps-json
=====

This is a minimal elixir proxy that accepts a mix.exs file as a POST body, and spits out the project dependencies as JSON.

Processed requests return a status code of 200 and JSON body, failed requests will return 422 and ":(" as the body.
