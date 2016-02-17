fs = require 'fs'

config = require './config'
started = {}

xtask = (name, desc, fn) ->
  if not fn
    fn = desc
    desc = undefined

  task name, desc, (options) ->
    stared[name] or= new Promise (resolve, reject) ->
      fn resolve, reject, opions

stubTask = (name, desc, warning) ->
  xtask name, desc, (resolve, reject, options) ->
    console.log warning
    resolve true

stubTask 'fetch', 'Acquire Astrolog source',
  "WARNING: Currently cannot fetch Astrolog files. Their servers are weird."

stubTask 'build', 'Build Astrolog',
  "WARNING: Build not yet implemented."

stubTask 'install', 'Install Astrolog',
  "WARNING: Install not yet implemented."
