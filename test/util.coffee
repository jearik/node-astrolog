util = require '../lib/util'
assert = require 'assert'

module.exports =
  util:
    listInList:
      "return index of sublist in superlist": ->
        subList = [3..5]
        superList = [0..10]

        where = util.listInList superList, subList
        assert.equal where, 3

      "return -1 for match failure": ->
        subList = [123, 456]
        superList = [0..10]

        where = util.listInList superList, subList
        assert.equal where, -1
