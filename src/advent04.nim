const range = 359282..820401

proc validPwd(n: int, ignoreRange: bool = false): bool =
  if n notin range and not ignoreRange:
    return false 

  let s = $n
  var last: char = '0'
  var twoPlus: bool = false
  for ch in s:
    if last == ch:
      twoPlus = true
    if ch < last:
      # must only increment or stay the same
      return false
    last = ch

  return twoPlus

when isMainModule:
  assert(validPwd(111111, ignoreRange = true))
  assert(not validPwd(223450, ignoreRange = true))
  assert(not validPwd(123789, ignoreRange = true))

  var count: int = 0
  for i in range:
    if validPwd(i):
      echo i
      count += 1
  echo "valid passwords: ", count
