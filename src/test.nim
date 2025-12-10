import redis, asyncdispatch
import os, strutils
import valkey_nim_lab

proc main() {.async.} =
  let client = await connectToValkey()
  echo "PING -> ", await client.ping()
  await client.setk("foo", "bar")
  let value = await client.get("foo")
  echo "GET foo -> ", value

when isMainModule:
  waitFor main()
