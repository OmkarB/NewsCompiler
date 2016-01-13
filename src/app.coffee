
request = require('request')
cherrio = require('cherrio')

request url, (err, response, body) ->
  if !err
    $ = cherrio.load(body)
