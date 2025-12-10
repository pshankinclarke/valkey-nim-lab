## valkey_nim_lab.nim
##
## Tiny helper for connecting to Valkey

import redis, asyncdispatch
import os, strutils

proc connectToValkey*(credsPath: string = getHomeDir() / "valkey.creds") {.async.} =
  let pass = readFile(credsPath).strip()
  let client = await openAsync()
  await client.auth(pass)
  return client
