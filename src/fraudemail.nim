import asyncdispatch, httpclient, json, strutils

const api = "https://api.fraudemail.com"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent":"Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.3",
    "Host": "api.fraudemail.com",
    "Content-Type": "application/json",
    "accept": "application/json"
  })

proc check_email*(email:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let json = %*{"email":email}
    let response = await client.post(api & "/email",body= $json)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
