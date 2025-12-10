import redis, asyncdispatch
import os, strutils

proc main() {.async.} =
  let pass = readFile(getHomeDir() / "valkey.creds").strip()
  
  let client = await openAsync()
  await client.auth(pass)

  echo "PING -> ", await client.ping()

  let info = await client.info()
  echo "Server info:"
  echo $info

  await client.setk("foo", "bar")
  let value = await client.get("foo")
  echo "GET foo -> ", value

when isMainModule:
  waitFor main()
