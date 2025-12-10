import redis, asyncdispatch
import os, strutils

proc main() {.async.} =
  ## Read the password 
  let pass = readFile(getHomeDir() / "valkey.creds").strip()
  
  ## Open a connection to Valkey running on the default port(6379)
  let client = await openAsync() # assuming defaults to "127.0.0.1", 6379.Port
  
  await client.auth(pass)

  echo "PING -> ", await client.ping()
  
  ## Set a key
  await client.setk("foo", "bar")
  
  ## Get the value
  let value = await client.get("foo")
  echo "GET foo -> ", value

when isMainModule:
  waitFor main()
