'use strict'

http = require 'http'

Q = require 'q'
_ = require 'underscore'
debug = require 'debug'

print = debug 'http'

exports.getJSON = (options) ->
    deferred = do Q.defer
    cache = ''

    cb = (res) ->
        print "recieved status code #{res.statusCode}"
        res.setEncoding 'utf8'

        res
            .on 'data', (chunk) ->
                cache += chunk
                print 'recieved chunk'
            .on 'end', ->
                deferred.resolve JSON.parse cache
                print 'connection ended without error'

    print "requesting #{options}"

    http
        .get(options, cb)
        .on 'error', (err) ->
            deferred.reject err

    deferred.promise
