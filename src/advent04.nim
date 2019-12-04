const range = 359282..820401

proc validPwd(n: int, ignoreRange: bool = false): bool =
  if n notin range and not ignoreRange:
    return false 

  let s = $n
  var
    last: char = '0'
    countSame: int = 1
    twoExact: bool = false

  for ch in s:
    if last == ch:
      countSame += 1
    else:
      if not twoExact:
        twoExact = countSame == 2
      countSame = 1

    if ch < last:
      # must only increment or stay the same
      return false

    last = ch

  if not twoExact:
    # case where it ended on a sequence of 2 same
    twoExact = countSame == 2

  return twoExact

when isMainModule:
  assert(validPwd(112233, ignoreRange = true))
  assert(validPwd(111122, ignoreRange = true))
  assert(not validPwd(111112, ignoreRange = true))
  assert(validPwd(112222, ignoreRange = true))
  assert(not validPwd(111222, ignoreRange = true))
  assert(validPwd(123345, ignoreRange = true))
  assert(not validPwd(123444, ignoreRange = true))
  assert(validPwd(111122, ignoreRange = true))

  var count: int = 0
  for i in range:
    if validPwd(i):
      echo i
      count += 1
  echo "valid passwords: ", count
