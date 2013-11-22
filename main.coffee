#!/usr/bin/env coffee
'use strict'

send = require './send'
#console.log process.argv[2]
api = process.argv[2]
#send.getJSON "http://api-dev.eztable.com/v2/share_shopping_app/search_product/?q=channel_id:1&sort_field=channel_67_default_weight&sort_order:1=&locale=en_US&start=0&n=5"
send.getJSON api
