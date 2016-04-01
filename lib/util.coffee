module.exports =
  listInList: (superList, subList) ->
    x = 0

    while -1 isnt x = superList.indexOf subList[0], x
      y = 1

      while y++ <= subList.length
        break if superList[x + y] isnt subList[y]

      return x

    return -1
